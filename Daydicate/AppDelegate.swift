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

class ListViewController: DaydicateViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPink
        title = "List"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "list.bullet", title: "List")
    }
}

class PlusViewController: DaydicateViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
        title = "Add Task"
    }
    
    override func commonInit() {
        setTabBarImage(imageName: "plus.circle.fill", title: "Add Task")
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
        let listVC = ListViewController()
        let plusVC = GoalFetchedResultsViewController()
        let rosetteVC = RosetteViewController()
        let personVC = PersonViewController()
        
        let listNC = UINavigationController(rootViewController: listVC)
        let plusNC = UINavigationController(rootViewController: plusVC)
        let rosetteNC = UINavigationController(rootViewController: rosetteVC)
        let personNC = UINavigationController(rootViewController: personVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeVC, listNC, plusNC, rosetteNC, personNC]
        
        window?.rootViewController = tabBarController
        
        tabBarController.tabBar.tintColor = .lightBlue
        tabBarController.tabBar.isTranslucent = false
        
        return true
    }
}

