//
//  SetGoalScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-14.
//

import UIKit
import SwiftKeychainWrapper

class SetGoalScreen: UIViewController {

    //Var
    
    var goal : String = ""
    
    //UI Comps
    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(6/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    let stepCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        label.text = "Step 5/6"
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "What's your goal ? "
        label.textAlignment = .center
        return label
    }()
    
   
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "goal"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let IwanttoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "I want to"
        label.textAlignment = .center
        return label
    }()
    
    let buttonLoose : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Loose weight", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonGain : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Gain muscles", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
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
    
    func setDB(){
        let saveSuccessful: Bool = KeychainWrapper.standard.set(goal, forKey: "goal")
    }
    
    @objc func getNext(){
        setDB()
        let vc = BMIScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(progressView)
        view.addSubview(stepCountLabel)
        view.addSubview(titleLabel)
        view.addSubview(image)
       view.addSubview(IwanttoLabel)
        
        vStack.addArrangedSubview(buttonLoose)
        vStack.addArrangedSubview(buttonGain)
        
        view.addSubview(vStack)
        view.addSubview(buttonContinue)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)
        
        //Button actions
        
        buttonLoose.addTarget(self, action: #selector(btnL), for: .touchUpInside)
        buttonGain.addTarget(self, action: #selector(btnG), for: .touchUpInside)
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
              
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            image.heightAnchor.constraint(equalToConstant: 240),
            image.widthAnchor.constraint(equalToConstant: 240),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
              
            IwanttoLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            IwanttoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            IwanttoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            IwanttoLabel.heightAnchor.constraint(equalToConstant: 120),
            
              
            vStack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 35),
            vStack.leadingAnchor.constraint(equalTo: IwanttoLabel.trailingAnchor, constant: -20),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            buttonContinue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            buttonContinue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonContinue.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonContinue.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonContinue.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    @objc func btnL(){
        buttonLoose.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        buttonGain.backgroundColor = .white
        
        buttonLoose.setTitleColor(.white, for: .normal)
        buttonGain.setTitleColor(.black, for: .normal)
        
        buttonLoose.layer.borderWidth = 0
        buttonGain.layer.borderWidth = 1
        
        goal = "Loose weight"
    }
    
    @objc func btnG(){
        buttonLoose.backgroundColor = .white
        buttonGain.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        
        buttonLoose.setTitleColor(.black, for: .normal)
        buttonGain.setTitleColor(.white, for: .normal)
        
        buttonLoose.layer.borderWidth = 1
        buttonGain.layer.borderWidth = 0
        
        goal = "Gain muscle"
    }
    
    
   
    
    

}
