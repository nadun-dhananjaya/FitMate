//
//  ViewExercise.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit
import WebKit

class ViewExercise:  UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private var pageViewController: UIPageViewController!
    private var pageControl: UIPageControl!
    private var currentIndex = 0 // Track current page index
    
    private var exerciseList = [ExeriseData]()

    
    private var stopwatch: Timer?
    private var stopwatchStartTime: Date?

  



    private var stopwatchLabel: UILabel!

   
    
    
    func getExercises(){
           fetchData(){result in
               switch(result){
               case .success(let movies):
                   DispatchQueue.main.async {
                       let movies = movies
                       self.exerciseList =  movies.data
                       self.updatePages(with: self.exerciseList)
                   }
               case .failure(let error):
                   print(error)
               }
           }
       }
   
       func fetchData(completion : @escaping(Result<ExerciseModel,Error>) -> Void){
           guard let url = URL(string: "https://fitmate-api.onrender.com/exercise/list") else {return}
   
           let dataTask = URLSession.shared.dataTask(with: url){ data, response, error in
               do {
                   guard let data = data else {return}
                   let currecyData = try JSONDecoder().decode(ExerciseModel.self, from: data)
                   print(currecyData)
                   completion(.success(currecyData))
               }
               catch{
                   completion(.failure(error))
               }
           }
   
           dataTask.resume()
       }

    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
        getExercises()
        setupPageViewController()
        setupPageControl()
        setupConstraints()
       
            
        }
        
        private func setupPageViewController() {
            pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            pageViewController.dataSource = self
            pageViewController.delegate = self
            
            if let initialViewController = viewController(at: 0) {
                pageViewController.setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
            }
            
            addChild(pageViewController)
            view.addSubview(pageViewController.view)
            pageViewController.didMove(toParent: self)
        }
        
        private func setupPageControl() {
            pageControl = UIPageControl()
            pageControl.numberOfPages = exerciseList.count
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .black
            
            view.addSubview(pageControl)
        }
        
        private func setupConstraints() {
            pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
                pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                pageViewController.view.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
                
                pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            if let scrollView = pageViewController.view.subviews.first as? UIScrollView {
                scrollView.isScrollEnabled = false
            }
        }

        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if let scrollView = pageViewController.view.subviews.first as? UIScrollView {
                scrollView.isScrollEnabled = true
            }
        }
        
    private var viewControllers: [UIViewController] = []

    private func updatePages(with newExercises: [ExeriseData]) {
        exerciseList = newExercises
    

        
        // Create new view controllers for each page
        for index in 0..<exerciseList.count {
            if let viewController = viewController(at: index) {
                viewControllers.append(viewController)
            }
        }
        
        // Set the first view controller and update the page control
           if let initialViewController = viewControllers.first {
               pageViewController.setViewControllers([initialViewController], direction: .forward, animated: true) { [weak self] _ in
                   self?.pageControl.numberOfPages = self?.viewControllers.count ?? 0
                   self?.pageControl.currentPage = 0
               }
           } else {
               pageControl.numberOfPages = 0
               pageControl.currentPage = 0
           }
        
     
    }
    
    
    
        // MARK: - UIPageViewControllerDataSource
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = indexOf(viewController) else {
                return nil
            }
            
            let previousIndex = index - 1
            if previousIndex < 0 {
                return nil
            }
            
            return self.viewController(at: previousIndex)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = index + 1
            if nextIndex >= exerciseList.count {
                return nil
            }
            
            return self.viewController(at: nextIndex)
        }
    
    

    
    

        private func viewController(at index: Int) -> UIViewController? {
            guard index >= 0 && index < exerciseList.count else {
                return nil
            }
            
            
            
            let viewController = UIViewController()
            
            let titleLabel = UILabel()
            titleLabel.text = exerciseList[index].exerciseName
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            titleLabel.textAlignment = .center
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            viewController.view.addSubview(titleLabel)
            
            let imageView = UIImageView()
            imageView.load(urlString: exerciseList[index].imageurl)
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            viewController.view.addSubview(imageView)
            
            
            
            let webView = WKWebView(frame: .zero)
            webView.translatesAutoresizingMaskIntoConstraints = false
            viewController.view.addSubview(webView)
        
         
            stopwatchLabel = UILabel()

            stopwatchLabel.text = "00:00:00" // Initial countdown value
            stopwatchLabel.font = UIFont.systemFont(ofSize: 50)
            stopwatchLabel.textAlignment = .center
            stopwatchLabel.translatesAutoresizingMaskIntoConstraints = false
            stopwatchLabel.textColor = .black
           
            
            let youtubeVideoURLString = exerciseList[index].videourl
            let youtubeEmbedURLString = "https://www.youtube.com/embed/\(extractYouTubeVideoID(from: youtubeVideoURLString))"
            let htmlString = "<html><body><iframe width=\"100%\" height=\"100%\" src=\"\(youtubeEmbedURLString)?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
            
            webView.loadHTMLString(htmlString, baseURL: nil)
            
            viewController.view.addSubview(stopwatchLabel)
            
            let nextButton = UIButton(type: .system)
            nextButton.setTitle("Next", for: .normal)
            nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton.backgroundColor = .orange
            nextButton.setTitleColor(.white, for: .normal)
            nextButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            nextButton.layer.cornerRadius = 10
            viewController.view.addSubview(nextButton)
            
            
         
            startStopwatch()
            
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 100),
                titleLabel.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
                
                imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                imageView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor,constant: 20),
                imageView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -20),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                webView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                webView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor, constant: 20),
                webView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -20),
                webView.heightAnchor.constraint(equalToConstant: 200),
                
                stopwatchLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 60),
                stopwatchLabel.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
                stopwatchLabel.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
                      
    
                
                nextButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
                nextButton.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -50),
                nextButton.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor,constant: 20),
                nextButton.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor, constant: -20),
                nextButton.heightAnchor.constraint(equalToConstant: 60),
            ])
            
           
            return viewController
        
    }

    @objc private func startStopwatch() {
        stopwatchStartTime = Date()
        stopwatch = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateStopwatch), userInfo: nil, repeats: true)
    }

    @objc private func stopStopwatch() {
        stopwatch?.invalidate()
        stopwatch = nil
        stopwatchStartTime = nil
    }

    @objc private func updateStopwatch() {
        guard let startTime = stopwatchStartTime else {
            return
        }
        
        let elapsedTime = Date().timeIntervalSince(startTime)
        let stopwatchText = formatStopwatchText(elapsedTime)
        stopwatchLabel.text = stopwatchText
    }

    private func formatStopwatchText(_ elapsedTime: TimeInterval) -> String {
        let hours = Int(elapsedTime / 3600)
        let minutes = Int((elapsedTime / 60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    
    @objc private func nextButtonTapped() {
    
        
        currentIndex = currentIndex + 1
        if currentIndex < exerciseList.count,
            let nextViewController = viewController(at: currentIndex) {
            pageViewController.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
            pageControl.currentPage = currentIndex
       
        } else {
            pageViewController.setViewControllers([viewController(at: 0)!], direction: .forward, animated: true, completion: nil)
            
            let vc = ExerciseFinishView()
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }

    private func indexOf(_ viewController: UIViewController) -> Int? {
        guard let viewControllers = pageViewController.viewControllers else {
            return nil
        }
        
        return viewControllers.firstIndex(of: viewController)
    }

    
    func extractYouTubeVideoID(from urlString: String) -> String {
        if let url = URL(string: urlString),
           let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems {
            return queryItems.first(where: { $0.name == "v" })?.value ?? ""
        }
        return ""
    }
    
    
}
