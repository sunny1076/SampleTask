//
//  SettingViewController.swift
//  SampleApp
//
//  Created by Gaurav on 22/06/20.
//  Copyright © 2020 Gaurav. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tablevw: UITableView!
    var objects :[String] = ["Timer","Blocking"]
    let cellReuseIdentifier = "cell"
    var setingvalue : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setingvalue = UserDefaults.standard.string(forKey: "setting")!
        tablevw.dataSource = self
        tablevw.delegate = self
        self.tablevw.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tablevw.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        let object = objects[indexPath.row]
       cell.textLabel?.text = object
        if setingvalue == object
        {
          cell.accessoryType = .checkmark
        }
      
       return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
      let object = objects[indexPath.row]
      let defaults = UserDefaults.standard
      defaults.set(object, forKey: "setting")
        self.dismiss(animated: true, completion: {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ModeChange"), object: nil)
        })
    }
    
    
}
