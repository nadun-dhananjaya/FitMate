//
//  HomeScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit

class HomeScreen: UIViewController {

    private let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Welcome to Fitmate"
           label.font = UIFont.boldSystemFont(ofSize: 24)
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let descriptionLabel: UILabel = {
           let label = UILabel()
           label.text = "Get fit and stay healthy"
           label.font = UIFont.systemFont(ofSize: 18)
           label.textAlignment = .center
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let startButton: UIButton = {
           let button = UIButton()
           button.setTitle("Start Workout", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .orange
           button.layer.cornerRadius = 8
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
    let logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "fitnessApp"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           setupConstraints()
       }
       
    
    
       private func setupConstraints() {
           view.addSubview(titleLabel)
           view.addSubview(descriptionLabel)
           view.addSubview(startButton)
           
           let imageView = UIImageView(image: UIImage(named: "fitnessApp"))
           imageView.contentMode = .scaleAspectFit
           imageView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(imageView)
           
           
           NSLayoutConstraint.activate([
               titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
               
               descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               imageView.widthAnchor.constraint(equalToConstant: 200),
               imageView.heightAnchor.constraint(equalToConstant: 200),
               
               startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
               startButton.widthAnchor.constraint(equalToConstant: 200),
               startButton.heightAnchor.constraint(equalToConstant: 50)
           ])
       }

}
