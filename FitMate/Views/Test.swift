//
//  Test.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-13.
//

import UIKit

class Test: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a vertical stack view
               let stackView = UIStackView()
               stackView.axis = .vertical
               stackView.distribution = .fillEqually
               stackView.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(stackView)
               
               // Add the first view to the stack view
               let firstView = UIView()
               firstView.backgroundColor = .red
               stackView.addArrangedSubview(firstView)
               
               // Add the second view to the stack view
               let secondView = UIView()
               secondView.backgroundColor = .green
               stackView.addArrangedSubview(secondView)
               
               // Add the third view to the stack view
               let thirdView = UIView()
               thirdView.backgroundColor = .blue
               stackView.addArrangedSubview(thirdView)
               
               // Add Auto Layout constraints to the stack view
               NSLayoutConstraint.activate([
                   stackView.topAnchor.constraint(equalTo: view.topAnchor),
                   stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
