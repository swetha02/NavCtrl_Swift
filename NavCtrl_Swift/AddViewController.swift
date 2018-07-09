//
//  AddViewController.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/29/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit

class AddViewController: UIViewController ,UITextFieldDelegate{
//    var frame: AddViewController!
    @IBOutlet weak var formView1: UIView!
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var companyTicker: UITextField!
    @IBOutlet weak var companyImageLink: UITextField!
 

    
    @IBAction func save(_sender:AnyObject){
//        print("save pressed")
        
        guard let companyName = companyName.text, companyName != "" else {
            print("Company name is requared")
            return
        }
        
        guard let companyTicker = companyTicker.text, companyTicker != "" else {
            print("Company ticker is requared")
            return
        }
        
        guard let companyImageLink = companyImageLink.text, companyImageLink != "" else {
            print("Company web is requared")
            return
        }
       

        let company = Company(compName: companyName, compImg: companyImageLink, companyTicker: companyTicker, companyPrice:"price")
        
        DAO.shared.addCompany(company: company)
        self.navigationController?.popViewController(animated: true)
        
        cleanTextField()
    }
    
    @IBAction func cancel(_sender:AnyObject){
cleanTextField()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func cleanTextField() {
        companyName.text?.removeAll()
        companyTicker.text?.removeAll()
        companyImageLink.text?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
        

//        let cancelBarButton = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancel))
//        self.navigationItem.leftBarButtonItem = cancelBarButton
//        color
        self.navigationController?.navigationBar.barTintColor = UIColor .green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        
        let saveBarButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(save))
        self.navigationItem.rightBarButtonItem = saveBarButton
        
        self.title = "company Name"
        
        
        NotificationCenter.default.addObserver(self, selector:#selector(AddProductViewC.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddProductViewC.UIKeyboardWillHide),name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddProductViewC.changeOrientation),name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        
        let customButton = UIButton()
        customButton.setImage(UIImage.init(named:"backArrow.png"), for: .normal)
        customButton.imageView?.contentMode = .scaleAspectFit
        customButton.imageView?.tintColor = .white
        customButton.addTarget(self, action: #selector(cancel(_sender:)), for: .touchUpInside)
        
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
        
        moveTextField(textField: self.companyImageLink, moveDistance: -250, up: true)
        //self.view.frame.origin.y -= 200
        
    }
    
    @objc func UIKeyboardWillHide(notification:NSNotification) {
        moveTextField(textField: self.companyImageLink, moveDistance: -250, up: false)
        //self.view.frame.origin.y += 200
    }
    

    
    
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
    
    
    
    
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
