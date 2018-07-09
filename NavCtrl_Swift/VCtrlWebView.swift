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
   
    
    var editProd = EditProduct()
    var productUrl : String?
//    var productIMG : [String]?
    var product: Product?
    var companyId: Int?
    var productId: Int?
    
    
    
    
    @IBAction func Back(_sender:AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
setweb()
        
    self.title = "Product Link"
        
        //create edit button
        let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonAction))
        self.navigationItem.rightBarButtonItem = editBarButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
//        backArrow
        let customButton = UIButton()
        customButton.setImage(UIImage.init(named:"backArrow.png"), for: .normal)
        customButton.imageView?.contentMode = .scaleAspectFit
        customButton.imageView?.tintColor = .white
        customButton.addTarget(self, action: #selector(Back(_sender: )), for: .touchUpInside)
        
        let barItem = barItemWithView(view: customButton, rect: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.navigationItem.leftBarButtonItem = barItem
        
        
    }
    
    func barItemWithView(view: UIView, rect: CGRect) -> UIBarButtonItem {
        let container = UIView(frame: rect)
        container.addSubview(view)
        view.frame = rect
        return UIBarButtonItem(customView: container)
        
    }
    
    
    @objc func editButtonAction(){
        
        editProd.product = product
        editProd.companyId = companyId
        editProd.productID = productId
    
        navigationController?.pushViewController(editProd, animated: true)
        
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
    
     
    

    
    
    
    
    
    
   

