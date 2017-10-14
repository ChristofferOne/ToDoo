//
//  TodoTabBarController.swift
//  To Dooo
//
//  Created by Christoffer Lundberg on 2017-10-13.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import UIKit

class TodoModel {
    private var pendingItems:[String] = []
    private var doneItems:[String] = []
    
    func addPending(text:String) {
        self.pendingItems.append(text)
    }
    
    func addDone(text:String) {
        self.doneItems.append(text)
    }
    
    func removePending(index:Int) {
        self.pendingItems.remove(at: index)
    }
    
    func removeDone(index:Int) {
        self.doneItems.remove(at: index)
    }
    
    func getPending() -> [String] {
        return self.pendingItems
    }
    
    func getDone() -> [String] {
        return self.doneItems
    }
}

class TodoTabBarController: UITabBarController {
    
    var model = TodoModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
