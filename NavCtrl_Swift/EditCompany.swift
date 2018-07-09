//
//  EditCompany.swift
//  NavCtrl_Swift
//
//  Created by swetha on 7/6/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit
import CoreData

class EditCompany: UIViewController {

    @IBOutlet weak var editCompName: UITextField!
    @IBOutlet weak var editCompTikker: UITextField!
    @IBOutlet weak var editCompImg: UITextField!
        
        
        
        
        
        
        
    var company: Company?
    var companyID: Int?


    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "Edit Company"
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel(_sender:)))
        self.navigationItem.leftBarButtonItem = cancelBarButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        
        let saveBarButton = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(save(_sender:)))
        self.navigationItem.rightBarButtonItem = saveBarButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white

        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        displayCurrentProductInfo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @IBAction func cancel(_sender:AnyObject){
        
        self.navigationController?.popViewController(animated: true)
        clearTxtFields()
    }
    
    
    
    func clearTxtFields(){
        editCompName.text?.removeAll()
        editCompTikker.text?.removeAll()
        editCompImg.text?.removeAll()
    }

    
    
    @IBAction func save(_sender:AnyObject){
        //        let name = productName.text
        
        guard let companyName = editCompName.text, companyName != "" else {
            print("product name is required")
            return
        }
        
        guard let companyTikker = editCompTikker.text, companyTikker != "" else {
            print("url is required")
            return
        }
        
        guard let companyImg = editCompImg.text, companyImg != "" else {
            print("image is required")
            return
        }
        let company = Company(compName:companyName, compImg:companyImg, companyTicker:companyTikker, companyPrice:"price" )
    
        guard companyID != nil else {return}
        DAO.shared.editCompany(company: company, companyId: companyID!)
        let comp = self.navigationController?.viewControllers[0]
        self.navigationController?.popToViewController( comp! , animated: true)

        

    }
    
    
    func displayCurrentProductInfo() {
        if let company = company{
            editCompName.text = company.compName
            editCompTikker.text = company.companyTicker
            editCompImg.text = company.compImg
        }
      
    }
        
    @IBAction func deleteEditCompany(_ sender: Any) {
        
        deleteCompany()
        guard let companyId = companyID, let company = company else {return}
        DAO.shared.deleteCompany(index: companyID!)
        //let count = self.navigationController?.viewControllers.count
        let prod = self.navigationController?.viewControllers[0]
        self.navigationController?.popToViewController( prod! , animated: true)
    }
    
    func deleteCompany(){
        editCompName.text?.removeAll()
        editCompTikker.text?.removeAll()
        editCompImg.text?.removeAll()
        
    }


}
