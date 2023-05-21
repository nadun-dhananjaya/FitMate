//
//  HomeScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit

class HomeScreen: UIViewController {

    private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Welcome"
           label.font = UIFont.boldSystemFont(ofSize: 24)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let subtitleLabel: UILabel = {
           let label = UILabel()
           label.text = ""
           label.font = UIFont.systemFont(ofSize: 16)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let panelView: UIView = {
           let view = UIView()
           view.backgroundColor = .systemOrange
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       private let progressLabel: UILabel = {
           let label = UILabel()
           label.text = "Your progress"
           label.font = UIFont.boldSystemFont(ofSize: 20)
           label.textColor = .white
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let progressView: UIProgressView = {
           let progressView = UIProgressView(progressViewStyle: .bar)
           progressView.setProgress(0/30, animated: true)
           progressView.trackTintColor = .white
           progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
           progressView.translatesAutoresizingMaskIntoConstraints = false

           return progressView
       }()
       
     
       
       private let imageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "fitnessApp")
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
       
       private let button: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Start Workout", for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.backgroundColor = .orange
           button.setTitleColor(.white, for: .normal) // Set text color to white
           button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
           button.layer.cornerRadius = 10
         
           return button
       }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
               
               setupUI()
               setupConstraints()
    }
    
    private func setupUI() {
            view.addSubview(titleLabel)
            view.addSubview(subtitleLabel)
            view.addSubview(panelView)
            panelView.addSubview(progressLabel)
            panelView.addSubview(progressView)
            view.addSubview(imageView)
            view.addSubview(button)
            button.addTarget(self, action: #selector(getExerciseList), for: .touchUpInside)
        }
        
        private func setupConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                subtitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
                
                panelView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
                panelView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
                panelView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -20),

                
                progressLabel.topAnchor.constraint(equalTo: panelView.topAnchor, constant: 30),
                progressLabel.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 20),
                

            
                progressView.leadingAnchor.constraint(equalTo: panelView.leadingAnchor, constant: 16),
                progressView.trailingAnchor.constraint(equalTo: panelView.trailingAnchor, constant: -16),
                progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 36),
                progressView.centerYAnchor.constraint(equalTo: panelView.centerYAnchor),
                progressView.heightAnchor.constraint(equalToConstant: 10),
                
                imageView.topAnchor.constraint(equalTo: panelView.bottomAnchor, constant: 80),
                imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
                button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -20),
                button.heightAnchor.constraint(equalToConstant: 60),

            ])
        }
    @objc func getExerciseList() {
        let vc = ExerciseListScreen()
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
