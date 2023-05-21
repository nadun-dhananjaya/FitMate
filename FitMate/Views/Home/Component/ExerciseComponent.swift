//
//  ExerciseComponent.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit

class ExerciseComponent: UICollectionViewCell {
    
        func set(exerciseData : ExeriseData)
        {
        
            exerciseImage.load(urlString: exerciseData.imageurl)
            exerciseName.text = exerciseData.exerciseName
            repCount.text = String(exerciseData.repCount) + " Reps"
        }
        
        private let exerciseImage : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView;
        }()
    
        private let exerciseName : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textAlignment = .left
            label.textColor = .black
            return label
        }()
    
    private let repCount : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    

        
        static let identifier = "ExerciseComponent"

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .white
            contentView.addSubview(exerciseImage)
            contentView.addSubview(exerciseName)
            contentView.addSubview(repCount)
            contentView.clipsToBounds = true
            exerciseImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            exerciseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
            exerciseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            exerciseImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
            exerciseImage.widthAnchor.constraint(equalToConstant: 100).isActive = true

            
            exerciseName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            exerciseName.leadingAnchor.constraint(equalTo: exerciseImage.trailingAnchor,constant: 10).isActive = true
            exerciseName.heightAnchor.constraint(equalToConstant: 20).isActive = true
         


            repCount.topAnchor.constraint(equalTo: exerciseName.bottomAnchor, constant: 3).isActive = true
            repCount.leadingAnchor.constraint(equalTo: exerciseImage.trailingAnchor,constant: 10).isActive = true
            repCount.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    extension UIImageView {
        func load(urlString : String) {
            guard let url = URL(string: urlString)else {
                return
            }
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }

