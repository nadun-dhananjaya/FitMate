//
//  SignUp.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit

class SignUp: UIViewController {

    // Create a vertical stack view
    var stackView : UIStackView =  {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView;
    }()
           

    let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let bodyView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let bodyVStack : UIStackView = {
        let stackView = UIStackView();
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let footerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()


    
    
    let emailVStack : UIStackView = {
        let stackView = UIStackView();
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let passwordVStack : UIStackView = {
        let stackView = UIStackView();
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.text = "Email"
        label.textAlignment = .left
        return label
    }()
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.text = "Password"
        label.textAlignment = .left
        return label
    }()
    
    let emailTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "email@gmail.com"
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    
    
    let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "25"
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        return textField
    }()
    

    
    let AppHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedSystemFont(ofSize: 32, weight: .thin)
        label.text = "Sign Up"
        label.textAlignment = .center
        return label
    }()
  
    
    let logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fitnessApp"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let btnLogin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    


    func setupLayouts(){
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(bodyView)
        stackView.addArrangedSubview(footerView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

        
        headerView.addSubview(AppHeader)
        
        bodyVStack.addArrangedSubview(logo)
        bodyVStack.addArrangedSubview(emailVStack)
        bodyVStack.addArrangedSubview(passwordVStack)
        
        emailVStack.addArrangedSubview(emailLabel)
        emailVStack.addArrangedSubview(emailTextField)
        passwordVStack.addArrangedSubview(passwordLabel)
        passwordVStack.addArrangedSubview(passwordTextField)
        
        bodyView.addSubview(bodyVStack)

    
        footerView.addSubview(btnLogin)
        
//        btnGetStarted.addTarget(self, action: #selector(getStarted), for: .touchUpInside)

        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            
            
            AppHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            AppHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            AppHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            AppHeader.heightAnchor.constraint(equalToConstant: 40),
            
            bodyVStack.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 20),
            bodyVStack.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -20),
            
          
          
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

        
            logo.heightAnchor.constraint(equalToConstant: 50),

            
            btnLogin.topAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: 30),
            btnLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            btnLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            btnLogin.heightAnchor.constraint(equalToConstant: 50),
            
        ])
       
        
    }

    
    @objc func getStarted(){
        let vc = SignIn()
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupLayouts()

        // Do any additional setup after loading the view.
    }
    
}
