//
//  HomeTabController.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import UIKit

class HomeTabController: UITabBarController {

  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTab()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .orange
//        self.tabBar.unselectedItemTintColor = .purple
    }
    

    private func setupTab(){
        
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeScreen())
        let schedule = self.createNav(with: "Schedule", and: UIImage(systemName: "calendar"), vc: ScheduleView())
//        let profile = self.createNav(with: "Profile", and: UIImage(systemName: "person.crop.circle"), vc: viewProfile())

        self.setViewControllers([home,schedule], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
        
    }

}
