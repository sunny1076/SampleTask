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
    var  timelable : UILabel!
    var gameTimer: Timer?
    var counter : Double = 0
    
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
            webView.load(URLRequest(url: url!))
            timelable  = UILabel (frame: CGRect(x: 0, y: self.view.frame.size.height-150, width:self.view.frame.size.width, height: 150))
            timelable.backgroundColor = .black
            timelable.textColor = .white
            timelable.textAlignment = .center
            timelable.adjustsFontSizeToFitWidth = true
            timelable.font =  .systemFont(ofSize: 35)
            view.addSubview(timelable)
            gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
            timelable.isHidden = false
            
//            let alert = UIAlertController(title: "Sorry", message: "this page can’t be loaded", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//           self.present(alert, animated: true, completion: nil)
           
        } else {
           // Open in myWebView
            webView.load(URLRequest(url: url!))
            guard (timelable != nil) else
            {
                return
            }
            timelable.isHidden = true
        }
       
    }
    
    @objc func runTimedCode()   {
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter/3600
        let min =  (flooredCounter%3600)/60
        var minstr = "\(min)"
        if min < 10 {
            minstr = "0\(minstr)"
        }
        let sec = (flooredCounter%3600)%60
        var secstr = "\(sec)"
        if sec < 10 {
            secstr = "0\(secstr)"
        }
        let desisec = String(format: "%.1f", counter).components(separatedBy: ".").last!
        timelable.text = "\(hour):\(minstr):\(secstr):\(desisec)"
       
    }
}


