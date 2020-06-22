//
//  SecondViewController.swift
//  SampleApp
//
//  Created by Gaurav on 22/06/20.
//  Copyright © 2020 Gaurav. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textvw: UITextView!
    @IBOutlet weak var backbtn: UIButton!
    @IBAction func back(_ sender: Any) {
        
    self.dismiss(animated: true, completion: {
        
    })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backbtn.backgroundColor = .clear
        backbtn.layer.cornerRadius = 5
        backbtn.layer.borderWidth = 1
        backbtn.layer.borderColor = UIColor(red: 13/255, green: 4/255, blue: 4/225, alpha: 1).cgColor
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
