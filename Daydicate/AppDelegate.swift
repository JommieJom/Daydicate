//
//  AppDelegate.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 14/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import UIKit

class DaydicateViewController: UIViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}

class RosetteViewController: DaydicateViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemIndigo
        title = "Rosette"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "rosette", title: "Rosette")
    }
}

class PersonViewController: DaydicateViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        title = "Profile"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "person.fill", title: "Profile")
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let homeVC = HomeViewController()
        let plusVC = GoalFetchedResultsViewController()
        let rosetteVC = AchievedFetchedResultsViewController()
        let personVC = PersonViewController()
        
        let personNC = UINavigationController(rootViewController: personVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, plusVC, rosetteVC, personNC]
        
        window?.rootViewController = tabBarController
        
        tabBarController.tabBar.tintColor = .lightBlue
        tabBarController.tabBar.isTranslucent = false
        
        return true
    }
}

