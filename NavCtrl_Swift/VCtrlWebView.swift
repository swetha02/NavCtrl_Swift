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
   
    var productUrl : String?
//    var productIMG : [String]?
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

//        productUrl = pro

//        if self.title == "iPad"{
//            self.productUrl = "https://www.apple.com"
//        }
//        else if self.title == "iPod"{
//            self.productUrl = "https://www.apple.com"
//
//        }
//        else if self.title == "iPhone"{
//            self.productUrl = "https://www.iphone.com"
//        }
//        else if self.title == "Galaxy S4" {
//            self.productUrl = "https://www.rentalcars.com"
//        }
//        else if self.title == "Galaxy Note"{
//            self.productUrl = "https://www.samsung.com"
//        }
//        else if self.title == "Galaxy Tab"{
//            self.productUrl = "https://www.samsung.com "
//        }
//        else if self.title == "Twitter Snap"{
//            self.productUrl = "https://www.twitter.com "
//        }
//
//        else if self.title == "Twitter Wiki"{
//            self.productUrl = "https://www.twitter.com "
//        }
//        else if self.title == "Twitter Web"{
//            self.productUrl = "https://www.twitter.com "
//        }
//
//        else if self.title == "ModelX"{
//            self.productUrl = "https://www.tesla.com "
//        }
//
//        else if self.title == "Model S"{
//            self.productUrl = " https://www.tesla.com"
//        }
//        else if self.title == "Model 3"{
//            self.productUrl = "https://www.tesla.com "
//        }
        
       setweb()



    
}
    
}
    
     
    

    
    
    
    
    
    
   

