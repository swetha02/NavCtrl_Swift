//
//  editProduct.swift
//  NavCtrl_Swift
//
//  Created by swetha on 6/26/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit
import CoreData

class EditProduct: UIViewController ,UITextFieldDelegate{
    var companyId:Int?
    var productID: Int?
    var product: Product?
    
    @IBOutlet weak var prodImg: UITextField!
    @IBOutlet weak var prodUrl: UITextField!
    @IBOutlet weak var productName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Edit Product"
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel(_sender:)))
        self.navigationItem.leftBarButtonItem = cancelBarButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        
        let saveBarButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(save(_sender:)))
        self.navigationItem.rightBarButtonItem = saveBarButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayCurrentProductInfo()

    }
    
    
    
    @IBAction func deleteProduct(_ sender: Any) {
        deleteTxtField()
        
         guard let companyId = companyId, let productID = productID else {return}
         DAO.shared.deleteProducts(companyId: companyId, productIndex: productID)
         //let count = self.navigationController?.viewControllers.count
         let prod = self.navigationController?.viewControllers[1]
         self.navigationController?.popToViewController( prod! , animated: true)
    }
    
    func deleteTxtField(){
    
        productName.text?.removeAll()
        prodUrl.text?.removeAll()
        prodImg.text?.removeAll()
        
    }
    
    @IBAction func cancel(_sender:AnyObject){

        self.navigationController?.popViewController(animated: true)
        clearTxtFields()
    }
    
    
    
    func clearTxtFields(){
        productName.text?.removeAll()
        prodUrl.text?.removeAll()
        prodImg.text?.removeAll()
    }

    func displayCurrentProductInfo() {
        if let product = product {
            productName.text = product.productName
            prodUrl.text = product.productUrl
            prodImg.text = product.productImg
        }
    }
    
    @IBAction func save(_sender:AnyObject){
//        let name = productName.text
        
        guard let productName = productName.text, productName != "" else {
            print("product name is requared")
            return
        }
        
        guard let productUrl = prodUrl.text, productUrl != "" else {
            print("url is requared")
            return
        }
        
        guard let productImage = prodImg.text, productImage != "" else {
            print("image is requared")
            return
        }
        let prod = Product(productName:productName,productImg:productImage, productUrl:productUrl)
        guard productID != nil else {return}

        DAO.shared.updateProducts(product: prod, companyId: companyId!, productId: productID!)
        let prodd = self.navigationController?.viewControllers[1]
        self.navigationController?.popToViewController( prodd! , animated: true)
        
    }
        
        
        
        
        
        
    }
    
    

    
