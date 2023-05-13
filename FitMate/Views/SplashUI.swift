//
//  SplashUI.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit

class SplashUI: UIViewController {

    //UI Comps
    
    
    // Create a vertical stack view
    var stackView : UIStackView =  {
        let stackView = UIStackView()
        stackView.backgroundColor = .blue
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
    
    
    let footerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    

    
    let AppHeader : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .monospacedSystemFont(ofSize: 48, weight: .thin)
        label.text = "FitMate"
        label.textAlignment = .center
        return label
    }()
  
    
    let logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fitnessApp"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let btnGetStarted : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Started", for: .normal)
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
        
        bodyView.addSubview(logo)
        
        footerView.addSubview(btnGetStarted)
        
        btnGetStarted.addTarget(self, action: #selector(getStarted), for: .touchUpInside)

        
        NSLayoutConstraint.activate([
            AppHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            AppHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            AppHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            AppHeader.heightAnchor.constraint(equalToConstant: 40),
            
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            
            btnGetStarted.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 30),
            btnGetStarted.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            btnGetStarted.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            btnGetStarted.heightAnchor.constraint(equalToConstant: 50),
            btnGetStarted.widthAnchor.constraint(equalToConstant: 227),
            
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
