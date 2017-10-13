//
//  SecondViewController.swift
//  To Dooo
//
//  Created by Christoffer Lundberg on 2017-10-13.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import UIKit

class DoneController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var DoneTableView: UITableView!
    
    var model:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.model = (self.tabBarController as! TodoTabBarController).model
        
        self.DoneTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        DoneTableView.delegate = self
        DoneTableView.dataSource = self
        DoneTableView.rowHeight = UITableViewAutomaticDimension
        DoneTableView.estimatedRowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.DoneTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addItem(text:String) {
        self.model!.addDone(text: text)
        self.DoneTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model!.getDone().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.DoneTableView.dequeueReusableCell(withIdentifier: "Cell") as! TodoTableViewCell
        cell.setText(text: self.model!.getDone()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            self.model!.removeDone(index: indexPath.row)
            self.DoneTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.DoneTableView.cellForRow(at: indexPath) as! TodoTableViewCell
        sendToPending(text: cell.getText())
        cell.removeFromSuperview()
        self.model!.removeDone(index: indexPath.row)
        self.DoneTableView.reloadData()
    }
    
    func sendToPending(text:String) {
        self.model!.addPending(text: text)
    }

}

