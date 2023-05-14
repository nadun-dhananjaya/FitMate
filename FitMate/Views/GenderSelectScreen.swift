//
//  GenderSelectScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit

class GenderSelectScreen: UIViewController {

    
    var gender : String = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(1/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 1/6"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "Let’s get to know you better"
        label.textAlignment = .center
        return label
    }()
    

    
    let imageGender: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gender"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let genederSelector : UIStackView = {
        let stackView = UIStackView();
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I am"
        label.textAlignment = .center
        return label
    }()
    

    
    let buttonMale : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Male", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .semibold)
        button.backgroundColor = UIColor(red: 157/255, green: 202/255, blue: 239/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonFemale : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Female", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32, weight: .semibold)
        button.backgroundColor =  UIColor(red: 253/255, green: 187/255, blue: 211/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
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
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(imageGender)
        view.addSubview(labelFive)
        view.addSubview(genederSelector)
        view.addSubview(buttonContinue)
        
        genederSelector.addArrangedSubview(buttonMale)
        genederSelector.addArrangedSubview(buttonFemale)

        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button Actions
        
        buttonMale.addTarget(self, action: #selector(propMale), for: .touchUpInside)
        buttonFemale.addTarget(self, action: #selector(propFemale), for: .touchUpInside)
        buttonContinue.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        
        //Constraints
        
        NSLayoutConstraint.activate([
            labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 20),
            labelTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelTwo.heightAnchor.constraint(equalToConstant: 40),
            
          
            
            imageGender.topAnchor.constraint(equalTo: labelTwo.bottomAnchor,constant: 120),
            imageGender.heightAnchor.constraint(equalToConstant: 180),
            imageGender.widthAnchor.constraint(equalToConstant: 180),
            imageGender.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelFive.topAnchor.constraint(equalTo: imageGender.bottomAnchor, constant: 20),
            labelFive.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelFive.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelFive.heightAnchor.constraint(equalToConstant: 40),
            
        
            
            genederSelector.topAnchor.constraint(equalTo: labelFive.bottomAnchor, constant: 35),
            genederSelector.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            genederSelector.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            genederSelector.heightAnchor.constraint(equalToConstant: 65),
      

            buttonContinue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonContinue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonContinue.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    //Button action functions
    
    @objc func propMale(){
        buttonMale.backgroundColor = UIColor(red: 60/255, green: 148/255, blue: 223/255, alpha: 1.0)
        buttonFemale.backgroundColor = UIColor(red: 253/255, green: 187/255, blue: 211/255, alpha: 1.0)
        
        gender = "Male"
    }
    
    @objc func propFemale(){
        buttonFemale.backgroundColor = UIColor(red: 250/255, green: 119/255, blue: 168/255, alpha: 1.0)
        buttonMale.backgroundColor = UIColor(red: 157/255, green: 202/255, blue: 239/255, alpha: 1.0)
        
        gender = "Female"
    }
    
    @objc func getNext(){
        let vc = AgeSelectScreen()
        navigationController?.pushViewController(vc, animated: true)
    }


}
