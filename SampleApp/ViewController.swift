//
//  ViewController.swift
//  SampleApp
//
//  Created by Gaurav on 18/06/20.
//  Copyright © 2020 Gaurav. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate  {
    var webView: WKWebView!
    
    override func loadView() {
      webView = WKWebView()
      webView.navigationDelegate = self
      view = webView
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setnavitionbar()
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    
    func setnavitionbar()  {
        let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00));
               myTextField.textColor = UIColor.blue
               myTextField.placeholder =  "Enter your urls...."
               myTextField.becomeFirstResponder()
               myTextField.delegate = self
               navigationItem.titleView = myTextField
    }
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        return true
      }

    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      loadurlinwebview(textField.text!)
      return true
    }
    
    
    func loadurlinwebview(_ urlstr : String)  {
        let url = URL(string: urlstr)
        guard  (url != nil) else {
            return
        }
        if url!.host == "www.youtube.com" {
            //  dont open in myWebView
            let alert = UIAlertController(title: "Sorry", message: "this page can’t be loaded", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
           
        } else {
           // Open in myWebView
            webView.load(URLRequest(url: url!))
        }
       
    }
}

