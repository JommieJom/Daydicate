//
//  AchievedFetchedResultsViewController.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 24/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import UIKit
import CoreData

class AchievedFetchedResultsViewController: DaydicateViewController {
    

    // 1
    var fetchedResultsController: NSFetchedResultsController<Achievement>!
    
    let viewContext = AchievementsManager.shared.persistentContainer.viewContext
    

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    

    let cellId = "insertCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "done"
        setTabBarImage(imageName: "rosette", title: "Achievements")
        layout()
        loadSavedData()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    

    func layout() {
        navigationItem.title = "Achievements"
        
        let addStackView = makeHorizontalStackView()
        addStackView.addArrangedSubview(tableView)

        view.addSubview(addStackView)

        addStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3).isActive = true
        addStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: addStackView.trailingAnchor, multiplier: 3).isActive = true

        tableView.topAnchor.constraint(equalToSystemSpacingBelow: addStackView.bottomAnchor, multiplier: 1).isActive = true
        tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1).isActive = true
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1).isActive = true
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 1).isActive = true
        
    }

    // 3
    func loadSavedData() {
        if fetchedResultsController == nil {
            let request = NSFetchRequest<Achievement>(entityName: "Achievement")
            let sort = NSSortDescriptor(key: "name", ascending: false)
            request.sortDescriptors = [sort]
            request.fetchBatchSize = 20

            fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: viewContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchedResultsController.delegate = self
        }

        do {
            try fetchedResultsController.performFetch()
            tableView.reloadData()
        } catch {
            print("Fetch failed")
        }
    }


}

// MARK:  - UITableView DataSource
extension AchievedFetchedResultsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        // 5
        // cell.textLabel?.text = achievements[indexPath.row]
        let achievement = fetchedResultsController.object(at: indexPath)
        // adding ...
        cell.imageView?.image = UIImage(named: "newbadge")

        cell.textLabel?.text = achievement.name

        cell.accessoryType = UITableViewCell.AccessoryType.none
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
            // 6 Deletion is now a two step process.
//            self.achievements.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // 6a. Delete CoreData here
            let achievement = self.fetchedResultsController.object(at: indexPath)
            AchievementsManager.shared.persistentContainer.viewContext.delete(achievement)
            AchievementsManager.shared.saveContext()
        })
        action.image = makeSymbolImage(systemName: "trash")

        let configuration = UISwipeActionsConfiguration(actions: [action])

        return configuration
    }
    
    // 7
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }

}

// 8
extension AchievedFetchedResultsViewController: NSFetchedResultsControllerDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates() // a
    }
          
    // 6b Update table via delegate callback here.
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade) // b
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        default:
            break
        }
    }
     
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates() // c
    }
}

// MARK:  - UITableView Delegate
extension AchievedFetchedResultsViewController: UITableViewDelegate {

}

