//
//  HeightInputScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class HeightInputScreen: UIViewController {

   
    //Var
    
    var heightNumber : String = ""
    var type : String     = ""
    var finalHeigh : String  = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(4/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let stepCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 4/6"
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "What's your height ?"
        label.textAlignment = .center
        return label
    }()
    
    let imageAge: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "height"))
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
    
   
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "120"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 36, weight: .semibold)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    
    let buttonCM : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("cm", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonFt : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ft", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        button.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 3
        return stack
    }()
    
    let buttonContinue : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
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
        view.addSubview(imageAge)
        view.addSubview(IamLabel)
        view.addSubview(textField)
        
        hStack.addArrangedSubview(buttonCM)
        hStack.addArrangedSubview(buttonFt)
        
        view.addSubview(hStack)
        view.addSubview(buttonContinue)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button actions
        
        buttonCM.addTarget(self, action: #selector(btnCM), for: .touchUpInside)
        buttonFt.addTarget(self, action: #selector(btnFt), for: .touchUpInside)
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
            
            imageAge.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageAge.heightAnchor.constraint(equalToConstant: 240),
            imageAge.widthAnchor.constraint(equalToConstant: 240),
            imageAge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            IamLabel.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 20),
            IamLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            IamLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            IamLabel.heightAnchor.constraint(equalToConstant: 55),
            
            
            textField.topAnchor.constraint(equalTo: imageAge.bottomAnchor, constant: 27),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 180),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 55),
            textField.widthAnchor.constraint(equalToConstant: 103),
            
            hStack.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40),
            hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonCM.heightAnchor.constraint(equalToConstant: 56),
            buttonCM.widthAnchor.constraint(equalToConstant: 120),
            buttonFt.heightAnchor.constraint(equalToConstant: 56),
            buttonFt.widthAnchor.constraint(equalToConstant: 120),
            
            buttonContinue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonContinue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonContinue.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    @objc func btnCM(){
        buttonCM.backgroundColor = UIColor(red: 182/255, green: 162/255, blue: 245/255, alpha: 1.0)
        buttonCM.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        
        type = "kg"
    }
    
    @objc func btnFt(){
        buttonFt.backgroundColor = UIColor(red: 182/255, green: 162/255, blue: 245/255, alpha: 1.0)
        buttonFt.backgroundColor = UIColor(red: 204/255, green: 190/255, blue: 248/255, alpha: 1.0)
        
        type = "lbs"
    }
    
    func setDB(){
        let saveSuccessful: Bool = KeychainWrapper.standard.set(heightNumber, forKey: "height")
    }
    
    //button action
    
    @objc func getNext(){
        setDB()
        let vc = ExerciseLevelScreen()
        navigationController?.pushViewController(vc, animated: true)
    }


}
