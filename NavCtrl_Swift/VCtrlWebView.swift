//
//  VCtrlWebView.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/16/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit
import WebKit

class VCtrlWebView: UIViewController {

    @IBOutlet weak var web: WKWebView!
    var webpage : [String]?
    var productUrl : String?
    var productIMG : [String]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
setweb()
        
    }


    @objc func toggleEditMode(){
        
    
    }
    
    
    func setweb(){
        
        if let productUrl = self.productUrl { // execute block if productUrl assigned as not nil
            
            if let Url = URL(string: productUrl){
                
                let request = URLRequest(url:Url)
                web.load(request)
            }
            
            
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        
        if self.title == "iPad"{
            self.productUrl = "https://www.apple.com"
        }
        else if self.title == "iPod Touch"{
            self.productUrl = "https://www.apple.com"

        }
        else if self.title == "iPhone"{
            self.productUrl = "https://www.iphone.com"
        }
        else if self.title == "Galaxy S4" {
            self.productUrl = "https://www.rentalcars.com"
        }
        else if self.title == "Galaxy Note"{
            self.productUrl = "https://www.samsung.com"
        }
        
       setweb()
        


    
}
    
}
    
     
    

    
    
    
    
    
    
   

