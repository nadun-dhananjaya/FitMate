//
//  BMIScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class BMIScreen: UIViewController {

   
    
    //Var
    
    var BMI = 1.2;
    //    var color = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
    
    let imageView: UIImageView = {
           let imageView = UIImageView()
//           imageView.image = UIImage(named: "BMI")
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
       
       let bmiLabel: UILabel = {
           let label = UILabel()
           label.text = "-"
           label.textAlignment = .center
           label.font = UIFont.boldSystemFont(ofSize: 30)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       let letsLabel: UILabel = {
           let label = UILabel()
           label.text = "Let's"
           label.textAlignment = .left
           label.font = UIFont.boldSystemFont(ofSize: 35)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       let calculateLabel: UILabel = {
           let label = UILabel()
           label.text = "-"
           label.textAlignment = .left
           label.font = UIFont.boldSystemFont(ofSize: 30)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       let nextButton: UIButton = {
           let button = UIButton(type: .roundedRect)
           button.setTitle("Start", for: .normal)
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
                
                view.addSubview(imageView)
                view.addSubview(bmiLabel)
                view.addSubview(letsLabel)
                view.addSubview(calculateLabel)
                view.addSubview(nextButton)
                calculateBMI()
                
                nextButton.addTarget(self, action: #selector(getNext), for: .touchUpInside)

            }
            
            func setupConstraints() {
                let safeArea = view.safeAreaLayoutGuide
                
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
                    imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
                    imageView.heightAnchor.constraint(equalToConstant: 250),
                    
                    bmiLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                    bmiLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                    bmiLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
                    
                    letsLabel.topAnchor.constraint(equalTo: bmiLabel.bottomAnchor, constant: 80),
                    letsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
                    
                    calculateLabel.topAnchor.constraint(equalTo: letsLabel.bottomAnchor),
                    calculateLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
                    
                    nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                    nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
                    nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
                    nextButton.heightAnchor.constraint(equalToConstant: 60),
                ])
           
            }
    
  
    func calculateBMI(){
        
        let data = UserDefaults.standard
        
        let weight = Double(data.integer(forKey: "weight"))
        let height = Double(data.integer(forKey: "height"))
        
        let bmi = (weight/(height/100)/(height/100))

        let bmiDouble = Double(bmi)

        print(weight, height, bmi, bmiDouble)
//
        if(bmiDouble<18.5){
            imageView.image = UIImage(named: "underweight")
            bmiLabel.text = "BMI : Underweight"
            calculateLabel.text = "Gain Muscle"
           
        } else if bmiDouble < 25 {
            bmiLabel.text = "BMI : Normal Weight"
            calculateLabel.text = "Gain Muscle"
            imageView.image = UIImage(named: "normal")
        } else if bmiDouble < 30 {
            bmiLabel.text = "BMI : Overweight"
            calculateLabel.text = "Lose Weight"
            imageView.image = UIImage(named: "overweight")
        } else {
            bmiLabel.text = "BMI : Obese"
            calculateLabel.text = "Lose Weight"
            imageView.image = UIImage(named: "obese")
        }
    }
    
    @objc func getNext() {
        
      
        UserDefaults.standard.set(1, forKey: "isFirstTime")
        
        let vc = HomeScreen()
        self.navigationController?.setViewControllers([vc], animated: true)
        
    }
}

