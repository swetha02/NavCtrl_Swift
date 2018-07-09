//
//  AddProductViewC.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/30/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit

class AddProductViewC: UIViewController,UITextFieldDelegate {
    
    var companyId: Int?
    var frameView: AddProductViewC!
    
    @IBOutlet weak var FormView: UIView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productImgUrl: UITextField!
    @IBOutlet weak var productViewUrl: UITextField!

    
    @IBAction func Back(_sender:AnyObject){
        self.navigationController?.popViewController(animated: true)
     }
    
    @IBAction func save(_sender:AnyObject){
        
        guard let productName = productName.text , productName != "" else {
            print("name required")
            return
        }
        guard let productURl = productViewUrl.text,productURl != "" else {
            print("url required")
            return
        }
        
        guard let prodcutImg = productImgUrl.text , prodcutImg != "" else {
            print("imgUrl required")
            return
        }
        
        let prod = Product(productName:productName,productImg:prodcutImg, productUrl:productURl)
        guard let companyId = companyId else {return}
        DAO.shared.addProducts(product: prod, companyId: companyId)
        self.navigationController?.popViewController(animated: true)

        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let backBarButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(Back))
//        self.navigationItem.leftBarButtonItem = backBarButton
        //        color
        self.navigationController?.navigationBar.barTintColor = UIColor .green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        
        let saveBarButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(save))
        self.navigationItem.rightBarButtonItem = saveBarButton
        
        self.title = "Add product"
        
        NotificationCenter.default.addObserver(self, selector:#selector(AddProductViewC.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(AddProductViewC.UIKeyboardWillHide),name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddProductViewC.changeOrientation),name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        
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
        
        
        
        
        
        
        
        
        

    
    
    @objc func changeOrientation(notification:NSNotification) {
        
        print("i know now that change Orientation happend")
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        moveTextField(textField: self.productViewUrl, moveDistance: -250, up: true)
        //self.view.frame.origin.y -= 200
        
    }
    
    @objc func UIKeyboardWillHide(notification:NSNotification) {
        moveTextField(textField: self.productViewUrl, moveDistance: -250, up: false)
        //self.view.frame.origin.y += 200
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
//
//        NotificationCenter.default.addObserver(self, selector:#selector(AddProductViewC.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(AddProductViewC.UIKeyboardWillHide),name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//           }
//
//
//  @objc func keyboardWillShow(notification:NSNotification) {
//
//
//
//   }
//
//
//    @objc func UIKeyboardWillHide(notification:NSNotification) {
//
//    }
    
    
    // keyboard shows
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        
        
    }
    
    // keyboard hidden
    func textFieldDidEndEditing(_ textField: UITextField)
    {
       // moveTextField(textField: textField, moveDistance: -250, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool){
        
        UIView.beginAnimations("animatedTxtField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(0.1)
        
        let movement: CGFloat = CGFloat (up ? moveDistance : -moveDistance )
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
         
        UIView.commitAnimations()
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
//
//
    
    
    
    
    
    
    
    
    
    
    


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }


}

