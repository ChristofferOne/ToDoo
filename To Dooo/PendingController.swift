//
//  FirstViewController.swift
//  To Dooo
//
//  Created by Christoffer Lundberg on 2017-10-13.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import UIKit

class PendingController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var PendingTableView: UITableView!
    
    var model:TodoModel?
    
    @IBAction func AddItemToList(_ sender: Any) {
        let alertController = UIAlertController(title: "Add item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField(configurationHandler: { (textField : UITextField) -> Void in
            textField.placeholder = "Text"
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (result : UIAlertAction) -> Void in
            //print("Cancel")
        })
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: { (result : UIAlertAction) -> Void in
            self.addItem(text: alertController.textFields!.first!.text!)
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    var pendingItems:[String] = ["Demo cell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model = (self.tabBarController as! TodoTabBarController).model
        
        self.PendingTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        PendingTableView.delegate = self
        PendingTableView.dataSource = self
        PendingTableView.rowHeight = UITableViewAutomaticDimension
        PendingTableView.estimatedRowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.PendingTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItem(text:String) {
        self.model!.addPending(text: text)
        self.PendingTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model!.getPending().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.PendingTableView.dequeueReusableCell(withIdentifier: "Cell") as! TodoTableViewCell
        cell.setText(text: self.model!.getPending()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.model!.removePending(index: indexPath.row)
            self.PendingTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.PendingTableView.cellForRow(at: indexPath) as! TodoTableViewCell
        sendToDone(text: cell.getText())
        cell.removeFromSuperview()
        self.model!.removePending(index: indexPath.row)
        self.PendingTableView.reloadData()
    }
    
    func sendToDone(text:String) {
        self.model!.addDone(text: text)
    }

}

