//
//  SetGoalScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class SetGoalScreen: UIViewController {

    var goal : String = ""
       
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
        label.text = "Select Your Goal"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let weightLossButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "WeightLoss"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let muscleGainButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "MuscleGain"), for: .normal)
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
        view.addSubview(weightLossButton)
        view.addSubview(muscleGainButton)
        view.addSubview(nextButton)
        weightLossButton.addTarget(self, action: #selector(weightLossButtonTapped), for: .touchUpInside)
        muscleGainButton.addTarget(self, action: #selector(muscleGainButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(getNext), for: .touchUpInside)

        weightLossButton.backgroundColor = .clear
        muscleGainButton.backgroundColor = .clear
        
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
            
            
            weightLossButton.topAnchor.constraint(equalTo: chooseLevelLabel.bottomAnchor, constant: 50),
            weightLossButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            weightLossButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            weightLossButton.heightAnchor.constraint(equalToConstant: 200),
                        
            muscleGainButton.topAnchor.constraint(equalTo: weightLossButton.bottomAnchor),
            muscleGainButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            muscleGainButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            muscleGainButton.heightAnchor.constraint(equalToConstant: 200),
                
    
            
            
            nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    
    
    @objc func weightLossButtonTapped() {
        weightLossButton.backgroundColor = levelButtonSelectedColor
        muscleGainButton.backgroundColor = .clear
        goal = "Weight Loss"
    }

    @objc func muscleGainButtonTapped() {
        muscleGainButton.backgroundColor = levelButtonSelectedColor
        weightLossButton.backgroundColor = .clear
        goal = "Muscle Gain"
    }
    
 
 

   
    @objc func getNext(){
        
        if(goal.isEmpty){
            let alert = UIAlertController(title: "Missing Goal", message: "Please choose your goal.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            
            let data = UserDefaults.standard
            data.set(goal, forKey: "goal")
            
            let vc = BMIScreen()
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
      
    }
    
    

}
