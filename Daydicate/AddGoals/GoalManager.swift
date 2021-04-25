//
//  GoalManager.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 22/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import CoreData

struct GoalManager {

    static let shared = GoalManager()

    let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "GoalModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()

    @discardableResult
    func createGoal(name: String) -> Goal? {
        let context = persistentContainer.viewContext
        
        let goal = NSEntityDescription.insertNewObject(forEntityName: "Goal", into: context) as! Goal // NSManagedObject
        goal.name = name

        do {
            try context.save()
            return goal
        } catch let createError {
            print("Failed to create: \(createError)")
        }

        return nil
    }

    func fetchGoals() -> [Goal]? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")

        do {
            let goals = try context.fetch(fetchRequest)
            return goals
        } catch let fetchError {
            print("Failed to fetch companies: \(fetchError)")
        }

        return nil
    }
    
    func createFetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    func fetchGol(withName name: String) -> Goal? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let goalss = try context.fetch(fetchRequest)
            return goalss.first
        } catch let fetchError {
            print("Failed to fetch: \(fetchError)")
        }

        return nil
    }
    

    func updateGoal(goal: Goal) {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch let createError {
            print("Failed to update: \(createError)")
        }
    }

    func deleteGoal(goal: Goal) {
        let context = persistentContainer.viewContext
        context.delete(goal)

        do {
            try context.save()
        } catch let saveError {
            print("Failed to delete: \(saveError)")
        }
    }

    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    
}
