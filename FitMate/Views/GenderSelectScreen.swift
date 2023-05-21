//
//  GenderSelectScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit
import SwiftKeychainWrapper

class GenderSelectScreen: UIViewController {

    
    var gender : String = ""
   
    let genderButtonSelectedColor = UIColor(hexString: "#fff2d9")

    let helloTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let chooseGenderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Your Gender"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let maleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "male"), for: .normal) // Replace "maleIcon" with the actual image for the male button
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let femaleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "female"), for: .normal) // Replace "femaleIcon" with the actual image for the female button
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Next", for: .normal)
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
        

        view.addSubview(helloTitleLabel)
        view.addSubview(chooseGenderTitleLabel)
        view.addSubview(maleButton)
        view.addSubview(femaleButton)
        view.addSubview(nextButton)
        maleButton.addTarget(self, action: #selector(maleButtonTapped), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(femaleButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(getNext), for: .touchUpInside)

        maleButton.backgroundColor = .clear
        femaleButton.backgroundColor = .clear
    }

    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
         
            helloTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            helloTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            helloTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            chooseGenderTitleLabel.topAnchor.constraint(equalTo: helloTitleLabel.bottomAnchor, constant: 20),
            chooseGenderTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            chooseGenderTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            maleButton.topAnchor.constraint(equalTo: chooseGenderTitleLabel.bottomAnchor, constant: 100),
            maleButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            maleButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            maleButton.heightAnchor.constraint(equalToConstant: 200),
            
            femaleButton.topAnchor.constraint(equalTo: chooseGenderTitleLabel.bottomAnchor, constant: 100),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor),
            femaleButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5),
            femaleButton.heightAnchor.constraint(equalToConstant: 200),
            
            nextButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc func maleButtonTapped() {
        maleButton.backgroundColor = genderButtonSelectedColor
        femaleButton.backgroundColor = .clear
        gender = "Male"
    }

    @objc func femaleButtonTapped() {
        femaleButton.backgroundColor = genderButtonSelectedColor
        maleButton.backgroundColor = .clear
        gender = "Female"
    }
 
    @objc func getNext(){
        if gender.isEmpty {
            let alert = UIAlertController(title: "Missing Gender", message: "Please choose your gender.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            
            let data = UserDefaults.standard
            data.set(gender, forKey: "gender")
            
            let vc = AgeSelectScreen()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        let r, g, b: CGFloat
        var hexColor = hexString
        
        if hexColor.hasPrefix("#") {
            let start = hexColor.index(hexColor.startIndex, offsetBy: 1)
            hexColor = String(hexColor[start...])
        }
        
        if hexColor.count != 6 {
            return nil
        }
        
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000FF) / 255
            
            self.init(red: r, green: g, blue: b, alpha: 1)
        } else {
            return nil
        }
    }
}

