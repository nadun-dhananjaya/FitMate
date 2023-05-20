//
//  AgeSelectScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class AgeSelectScreen: UIViewController, UITextFieldDelegate {

    
    var age : String = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(2/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let stepCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 2/6"
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "How old are you ?"
        label.textAlignment = .center
        return label
    }()
    

    
    let imageGender: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "age"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    let IamLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I am"
        label.textAlignment = .center
        return label
    }()
    

    let ageTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "25"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 36, weight: .semibold)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    
    
    let buttonContinue : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

       
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(stepCountLabel)
        view.addSubview(titleLabel)
        view.addSubview(imageGender)
        view.addSubview(IamLabel)
        view.addSubview(ageTextField)
        view.addSubview(buttonContinue)
        
      
  
        ageTextField.inputAccessoryView = toolBar()


        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button Actions
        
         buttonContinue.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        
        //Constraints
        
        NSLayoutConstraint.activate([
            stepCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stepCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stepCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: stepCountLabel.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
          
            
            imageGender.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 40),
            imageGender.heightAnchor.constraint(equalToConstant: 180),
            imageGender.widthAnchor.constraint(equalToConstant: 180),
            imageGender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            IamLabel.topAnchor.constraint(equalTo: imageGender.bottomAnchor, constant: 20),
            IamLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            IamLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            IamLabel.heightAnchor.constraint(equalToConstant: 40),
            
        
            
            ageTextField.topAnchor.constraint(equalTo: IamLabel.bottomAnchor, constant: 35),
            ageTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            ageTextField.heightAnchor.constraint(equalToConstant: 65),
      

            buttonContinue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonContinue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonContinue.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    //Button action functions
    
    
    
    @objc func getNext(){

        // Validate age input
        guard let ageString = ageTextField.text, let age = Int(ageString), age >= 0 && age <= 120 else {
            let alert = UIAlertController(title: "Invalid Age", message: "Please enter a valid age between 0 and 120.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let data = UserDefaults.standard
        data.set(age, forKey: "age")
        
        let vc = WeightInputScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
}
