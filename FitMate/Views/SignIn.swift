//
//  SignIn.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit

class SignIn: UIViewController {

   
    

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fitnessApp") // Replace "logo" with the actual name of your logo image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Make Yourself"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fitLabel: UILabel = {
        let label = UILabel()
        label.text = "Fit"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal) // Set text color to white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal) // Set text color to white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isAuth = Int(UserDefaults.standard.integer(forKey: "isAuth"))
        
        if(isAuth == 2)
        {
            let vc = HomeScreen()
            self.navigationController?.setViewControllers([vc], animated: true)
        }
        
        
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(fitLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        view.addSubview(signUpButton)

    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            fitLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            fitLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            fitLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: fitLabel.bottomAnchor, constant: 20),
            usernameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        loginButton.addTarget(self, action: #selector(makeLogin), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpScreen), for: .touchUpInside)


    }

    
    @objc func getStarted(){
        let vc = SignIn()
        navigationController?.pushViewController(vc, animated: true)
    }
    

    @objc func signUpScreen(){
        let vc = SignUp()
        navigationController?.pushViewController(vc, animated: true)
    }
    


    @objc func makeLogin(){
       sendPostRequest()
    }
    
    
    func sendPostRequest() {
        
        guard let usernameString = usernameTextField.text, !(usernameString.isEmpty) else {
            let alert = UIAlertController(title: "Invalid username", message: "Please enter a valid username.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        guard let passwordString = passwordTextField.text, !(passwordString.isEmpty) else {
            let alert = UIAlertController(title: "Invalid password", message: "Please enter a valid password.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        
        // Create the URL for your API endpoint
        guard let url = URL(string: "https://fitmate-api.onrender.com/user/login") else {
            print("Invalid URL")
            return
        }
        
        // Create the request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set the request body data, if needed
        let parameters: [String: Any] = [
            "username": usernameString,
            "password": passwordString
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error encoding request body: \(error)")
            return
        }
        
        // Set the request headers, if needed
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create the URLSession and data task
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            // Handle the response data, if needed
            if let responseData = data {
                // Parse and process the response data
                do {
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any],
                        let status = json["status"] as? Int ,
                        let data = json["data"] as? [String: Any],
                        let username = data["username"] as? String,
                        let totalDays = data["totalDays"] as? Int,
                        let completedDays = data["completedDays"] as? Int {
                        print(status)
                        if(status == 200){
                            DispatchQueue.main.async {
                                // Display an alert with the message
                                let data = UserDefaults.standard
                                data.set(1, forKey: "isAuth")
                                
                                let isFirstTime = Int(data.integer(forKey: "isFirstTime"))
                
                                data.set(username, forKey: "username")
                                data.set(totalDays, forKey: "totalDays")
                                data.set(completedDays, forKey: "completedDays")
                          
                                
                                if(isFirstTime == 1 )
                                {
                                    let vc = HomeScreen()
                                    self.navigationController?.setViewControllers([vc], animated: true)
                                }
                                else{
                          
                                    

                                    
                                 
                                
                                    let vc = GenderSelectScreen()
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }
                            }
                        }
                        else{
                            if let message = json["message"] as? String {
                                DispatchQueue.main.async {
                                                  // Display an alert with the message
                                                  let alertController = UIAlertController(title: "Response", message: message, preferredStyle: .alert)
                                                  let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                                  alertController.addAction(okAction)
                                                  self.present(alertController, animated: true, completion: nil)
                                              }
                            }
                           
                        }
                      } else {
                          print("Invalid response JSON or missing 'status' field")
                      }
                    
                
                    
                    // Process the response JSON here
                } catch {
                    print("Error decoding response JSON: \(error)")
                }
            }
        }
        
        // Start the data task
        task.resume()
    }


}
