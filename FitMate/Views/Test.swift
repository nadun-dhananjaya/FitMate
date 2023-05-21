//
//  Test.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-21.
//

import UIKit
import LKRulerPicker


class Test: UIViewController, LKRulerPickerDataSource, LKRulerPickerDelegate {
    
    var age : String = ""
    func rulerPicker(_ picker: LKRulerPicker, didSelectItemAtIndex index: Int) {
        age = rulerPicker(picker, highlightTitleForIndex: index) ?? ""
      }
    
    
    func rulerPicker(_ picker: LKRulerPicker, titleForIndex index: Int) -> String? {
        guard index % picker.configuration.metrics.divisions == 0 else { return nil }
               switch picker {
               case agePicker:
                   return "\(picker.configuration.metrics.minimumValue + index) "
               default:
                   fatalError("Handler picker")
               }
    }
    
    func rulerPicker(_ picker: LKRulerPicker, highlightTitleForIndex index: Int) -> String? {
        switch picker {
               case agePicker:
                   return "\(picker.configuration.metrics.minimumValue + index) cm"
            
               default:
                   fatalError("Handler picker")
               }
    }
    

    
    let progressView : UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(2/6, animated: true)
        progressView.trackTintColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        progressView.progressTintColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        return progressView
    }()
    
    
    let ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "How old are you?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "man") // Replace "personIcon" with the actual image for the person
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    private lazy var agePicker: LKRulerPicker = {
        $0.dataSource = self
        $0.delegate = self
        $0.tintColor = UIColor.black.withAlphaComponent(0.5)
        $0.highlightLineColor = .black
        $0.highlightTextColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(LKRulerPicker())

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
        view.addSubview(progressView)

        view.addSubview(ageTitleLabel)
        view.addSubview(personImageView)
        view.addSubview(agePicker)
        view.addSubview(nextButton)
        
        progressView.frame = CGRect(x: (view.frame.size.width)/8, y: 100, width: view.frame.size.width-100, height: 20)

        
        let heightMetrics = LKRulerPickerConfiguration.Metrics(
                    minimumValue: 10,
                    defaultValue: 20,
                    maximumValue: 120,
                    divisions: 5,
                    fullLineSize: 38,
                    midLineSize: 28,
                    smallLineSize: 28)
        
        agePicker.configuration = LKRulerPickerConfiguration(
                    scrollDirection: .horizontal,
                    alignment: .end,
                    metrics: heightMetrics,
                    isHapticsEnabled: false)
    }
    
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
          
            progressView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            progressView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),

            ageTitleLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 50),
            ageTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            ageTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),


            personImageView.topAnchor.constraint(equalTo: ageTitleLabel.bottomAnchor, constant: 20),
            personImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            personImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            personImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 250),

            agePicker.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 20),
            agePicker.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            agePicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            agePicker.heightAnchor.constraint(equalToConstant: 100),

            nextButton.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }

}

