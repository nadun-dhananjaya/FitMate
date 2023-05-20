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
    
    //UI Comps
    
    let labelOne : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "According to"
        label.textAlignment = .center
        return label
    }()
    
    let labelTwo : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Body Mass Index"
        label.textAlignment = .center
        return label
    }()
    
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "BMI"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelThree : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "You"
        label.textAlignment = .center
        return label
    }()
    
    let labelFour : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Are"
        label.textAlignment = .center
        return label
    }()
    
    let vStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    let hStackMid : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    let labelFive : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .thin)
        label.text = "-"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 1/255, green: 166/255, blue: 170/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let labelSix : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "Let's"
        label.textAlignment = .center
        return label
    }()
    
    let labelSeven : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .regular)
        label.text = "-"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    let hStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    let buttonStart : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI();
       
    }
    
    func setupUI(){
        // Assuming you are using Auto Layout with UI Kit

        // Set background color
        view.backgroundColor = .white

        // Add subviews
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(image)
        view.addSubview(labelThree)
        view.addSubview(labelFour)
        view.addSubview(hStackMid)
        view.addSubview(hStack)
        view.addSubview(buttonStart)

        // Add arranged subviews to vStack
        vStack.addArrangedSubview(labelThree)
        vStack.addArrangedSubview(labelFour)

        // Add arranged subviews to hStackMid
        hStackMid.addArrangedSubview(vStack)
        hStackMid.addArrangedSubview(labelFive)

        // Add arranged subviews to hStack
        hStack.addArrangedSubview(labelSix)
        hStack.addArrangedSubview(labelSeven)

        // Set constraints
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 40).isActive = true
        labelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: labelTwo.bottomAnchor, constant: 50).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 240).isActive = true
        image.heightAnchor.constraint(equalToConstant: 180).isActive = true

        hStackMid.translatesAutoresizingMaskIntoConstraints = false
        hStackMid.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40).isActive = true
        hStackMid.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        labelFive.translatesAutoresizingMaskIntoConstraints = false
        labelFive.widthAnchor.constraint(equalToConstant: 200).isActive = true
        labelFive.heightAnchor.constraint(equalToConstant: 100).isActive = true

        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.topAnchor.constraint(equalTo: hStackMid.bottomAnchor, constant: 50).isActive = true
        hStack.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 60).isActive = true

        labelSeven.translatesAutoresizingMaskIntoConstraints = false
        labelSeven.widthAnchor.constraint(equalToConstant: 200).isActive = true
        labelSeven.heightAnchor.constraint(equalToConstant: 50).isActive = true

        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 60).isActive = true
        buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStart.widthAnchor.constraint(equalToConstant: 227).isActive = true
        buttonStart.heightAnchor.constraint(equalToConstant: 50).isActive = true

        buttonStart.addTarget(self, action: #selector(getNext), for: .touchUpInside)
        calculateBMI()
    
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
            labelFive.text = "Underweight"
            labelSeven.text = "Gain Muscle"
        } else if bmiDouble < 25 {
            labelFive.text = "Normal Weight"
            labelSeven.text = "Gain Muscle"
        } else if bmiDouble < 30 {
            labelFive.text = "Overweight"
            labelSeven.text = "Lose Weight"
        } else {
            labelFive.text = "Obese"
            labelSeven.text = "Lose Weight"
        }
    }
    
    @objc func getNext() {
        
      
        
        let tabBarController = UITabBarController()
        
        
        
        let home = UINavigationController(rootViewController: HomeScreen())
        let schedule = UINavigationController(rootViewController: ScheduleView())
//        let progress = UINavigationController(rootViewController: viewProgress())
//        let profile = UINavigationController(rootViewController: viewProfile())
        
        home.title = "Home"
        schedule.title = "Schedule"
//        progress.title = "Progress"
//        profile.title = "Profile"
        
        tabBarController.setViewControllers([home,schedule], animated: false)
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        
        let images = ["house","calendar","chart.xyaxis.line","person.crop.circle"]
    
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].badgeColor = UIColor.orange
        }
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.tintColor = .orange
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: false)
        
    }
}

