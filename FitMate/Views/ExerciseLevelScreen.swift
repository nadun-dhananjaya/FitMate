//
//  ExerciseLevelScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class ExerciseLevelScreen: UIViewController {

   
    //Var
    
    var level : String = ""
       
    let levelButtonSelectedColor = UIColor(hexString: "#fff2d9")

  
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(2/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let chooseLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Your Level"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let beginnerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "beginnerBody"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let intermediateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "intermediateBody"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let advancedButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "advancedBody"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(chooseLevelLabel)
        view.addSubview(beginnerButton)
        view.addSubview(intermediateButton)
        view.addSubview(advancedButton)
        view.addSubview(nextButton)
        beginnerButton.addTarget(self, action: #selector(beginnerButtonTapped), for: .touchUpInside)
        intermediateButton.addTarget(self, action: #selector(intermediateButtonTapped), for: .touchUpInside)
        advancedButton.addTarget(self, action: #selector(advancedButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(getNext), for: .touchUpInside)

        beginnerButton.backgroundColor = .clear
        intermediateButton.backgroundColor = .clear
        advancedButton.backgroundColor = .clear
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)

    }

    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
         
            progressView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            progressView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            
            chooseLevelLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50),
            chooseLevelLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            chooseLevelLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            
            beginnerButton.topAnchor.constraint(equalTo: chooseLevelLabel.bottomAnchor, constant: 50),
            beginnerButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            beginnerButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            beginnerButton.heightAnchor.constraint(equalToConstant: 150),
                        
            intermediateButton.topAnchor.constraint(equalTo: beginnerButton.bottomAnchor),
            intermediateButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            intermediateButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            intermediateButton.heightAnchor.constraint(equalToConstant: 150),
                
            advancedButton.topAnchor.constraint(equalTo: intermediateButton.bottomAnchor),
            advancedButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            advancedButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            advancedButton.heightAnchor.constraint(equalToConstant: 150),
                      
            
            
            nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    
    @objc func beginnerButtonTapped() {
        beginnerButton.backgroundColor = levelButtonSelectedColor
        intermediateButton.backgroundColor = .clear
        advancedButton.backgroundColor = .clear
        level = "Beginner"
    }

    @objc func intermediateButtonTapped() {
        intermediateButton.backgroundColor = levelButtonSelectedColor
        beginnerButton.backgroundColor = .clear
        advancedButton.backgroundColor = .clear
        level = "Intermediate"
    }
    
    @objc func advancedButtonTapped() {
        advancedButton.backgroundColor = levelButtonSelectedColor
        beginnerButton.backgroundColor = .clear
        intermediateButton.backgroundColor = .clear
        level = "Advanced"
    }
 

      
    
    //button action
    
    @objc func getNext(){
      
            
        if(level.isEmpty){
            let alert = UIAlertController(title: "Missing Level", message: "Please choose your level.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            let data = UserDefaults.standard
            data.set(level, forKey: "Level")
            
            let vc = SetGoalScreen()
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }

}
