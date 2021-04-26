//
//  AchievementsManager.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 24/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import CoreData

struct AchievementsManager {

    static let shared = AchievementsManager()


    let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "AchievementModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()

    @discardableResult
    func createAchievement(name: String) -> Achievement? {
        let context = persistentContainer.viewContext
        
        let achievement = NSEntityDescription.insertNewObject(forEntityName: "Achievement", into: context) as! Achievement // NSManagedObject
        achievement.name = name

        do {
            try context.save()
            return achievement
        } catch let createError {
            print("Failed to create: \(createError)")
        }

        return nil
    }

    func fetchAchievement() -> [Achievement]? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Achievement>(entityName: "Achievement")

        do {
            let achievements = try context.fetch(fetchRequest)
            return achievements
        } catch let fetchError {
            print("Failed to fetch companies: \(fetchError)")
        }

        return nil
    }
    
    func createFetchRequest() -> NSFetchRequest<Achievement> {
        return NSFetchRequest<Achievement>(entityName: "Achievement")
    }


    func updateAchievement(achievement: Achievement) {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch let createError {
            print("Failed to update: \(createError)")
        }
    }

    func deleteAchievement(achievement: Achievement) {
        let context = persistentContainer.viewContext
        context.delete(achievement)

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
    
    
    func countContext() -> Int {
        let context = persistentContainer.viewContext
        var countA: Int?
        countA = try? context.count(for: NSFetchRequest(entityName: "Achievement"))
        
        return countA!
    }
    
    
}
