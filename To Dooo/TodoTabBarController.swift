//
//  TodoTabBarController.swift
//  To Dooo
//
//  Created by Christoffer Lundberg on 2017-10-13.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import UIKit
import CoreData

class TodoModel {
    private var pendingItems:[String] = []
    private var doneItems:[String] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addPending(text:String) {
        addToContext(entity: "Pending", text: text)
    }
    
    func addDone(text:String) {
        addToContext(entity: "Done", text: text)
    }
    
    func removePending(index:Int) {
        deleteInContext(index: index, entity: "Pending")
    }
    
    func removeDone(index:Int) {
        deleteInContext(index: index, entity: "Done")
    }
    
    func getPending() -> [String] {
        return retrieveContext(entity: "Pending")
    }
    
    func getDone() -> [String] {
        return retrieveContext(entity: "Done")
    }
    
    func addToContext(entity:String, text:String) {
        let newPending = NSEntityDescription.insertNewObject(forEntityName: entity, into: context)
        newPending.setValue(text, forKey: "text")
        do {
            try context.save()
        } catch {
            print("Saving error to handle")
        }
    }
    
    func retrieveContext(entity:String) -> [String] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        var resultArray:[String] = []
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let text = result.value(forKey: "text") as? String {
                        resultArray.append(text)
                    }
                }
            }
        } catch {
            print("Failed to get request")
        }
        return resultArray
    }
    
    func deleteInContext(index:Int, entity:String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            context.delete(results[index] as! NSManagedObject)
            do {
                try context.save()
            } catch {
                print("Saving error to handle")
            }
        } catch {
            print("Failed to get request")
        }
    }
}

class TodoTabBarController: UITabBarController {
    
    var model = TodoModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
