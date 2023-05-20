//
//  HomeScreen.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit

class HomeScreen3: UIViewController {
//    private var collectionView : UICollectionView?
//
//    private var exerciseList = [ExeriseData]()
//
//    
//    func setLayouts(){
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: (view.frame.width) - 4, height: 100)
//        layout.minimumLineSpacing = 8
//        layout.minimumInteritemSpacing = 1
//        
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        guard let collectionView = collectionView else {
//            return
//        }
//        
//        collectionView.register(ExerciseComponent.self,forCellWithReuseIdentifier: ExerciseComponent.identifier)
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.frame = view.bounds
//        collectionView.backgroundColor =  .white
//       
//        view.addSubview(collectionView)
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setLayouts()
//        getMovies()
//        // Do any additional setup after loading the view.
//    }
//    
//    func getMovies(){
//        
//        fetchData(){result in
//            switch(result){
//            case .success(let movies):
//                DispatchQueue.main.async {
//                    let movies = movies
//                    self.exerciseList =  movies.data
//                    print(self.exerciseList)
//                    guard let collectionView = self.collectionView else {
//                        return
//                    }
//                    collectionView.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    
//    func fetchData(completion : @escaping(Result<ExerciseModel,Error>) -> Void){
//        guard let url = URL(string: "https://fitmate-api.onrender.com/exercise/list") else {return}
//        
//        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error in
//            do {
//                guard let data = data else {return}
//                let currecyData = try JSONDecoder().decode(ExerciseModel.self, from: data)
//                print(currecyData)
//                completion(.success(currecyData))
//            }
//            catch{
//                completion(.failure(error))
//            }
//        }
//        
//        dataTask.resume()
//    }
//                  
//}
//
//
//extension HomeScreen : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(exerciseList.count)
//        return exerciseList.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseComponent.identifier, for: indexPath) as! ExerciseComponent
//        cell.set(exerciseData: exerciseList[indexPath.row])
//        return cell
//    }
//    
    
    
}




extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
