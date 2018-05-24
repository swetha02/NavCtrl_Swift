//
//  CompanyVC.swift
//  NavCtrl_Swift
//
//  Created by Jesse Sahli on 2/22/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

import UIKit

class CompanyVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    //
//    var companyList : [String]?

//    var companyImages : [String]()
    
    var companysList = [Company]()
    
    var productViewController : ProductVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        let dao = DAO.shared
        
        
        
        
        dao.createCompanys()
        companysList = dao.companysList
        
        
//        self.companyList = ["Apple Inc (APPL)","Google (GOOG)","Twitter (TWTR)","Tesla (TSLA)"]
//
//        self.companyImages = ["apple.png","google.png","twitter.png","tesla.png"]
//
        //create edit button
        let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditMode))
        self.navigationItem.rightBarButtonItem = editBarButton
        
//        color
        self.navigationController?.navigationBar.barTintColor = UIColor .green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]

        
        self.title = "Stock Tracker"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleEditMode() {
        if self.navigationItem.rightBarButtonItem?.title == "Edit" {
            self.tableView.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Done"
        } else {
            self.tableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
    }
}

// MARK: delegate & datasource methods

extension CompanyVC: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if companysList.count > 0 {
            return companysList.count
        } else {
            print("unknown number of rows... companyList is nil!")
            return 0
        }
    }
    /*
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.companysList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
        
        
    }
    
   
    
    
    
    /*
    // Override to support rearranging the table view
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let items = companysList[sourceIndexPath.row]
        companysList.remove(at: sourceIndexPath.row)
        companysList.insert(items, at: destinationIndexPath.row)
        
    }
    
    
    
    
    
    
    
    /*
    // Override to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool{
        return true
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) ??
        UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier)
        
        cell.imageView?.image = UIImage(named: companysList[indexPath.row].compImg)
        cell.textLabel?.text = companysList[indexPath.row].compName
 
       return cell
    }
    
    
    // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.productViewController = ProductVC()
        
        productViewController?.products = companysList[indexPath.row].products
        
        self.navigationController?.pushViewController(self.productViewController!, animated: true)

        
   //     self.productViewController?.title = companysList[indexPath.row]
        
//        if indexPath.row == 0 {
//            self.productViewController?.title = "Apple Inc(APPL)"
//        } else if indexPath.row == 1{
//            self.productViewController?.title = "Google (GOOG)"
//        }
//       else if indexPath.row == 2 {
//            self.productViewController?.title = "Twitter (TWTR)"
//        }
//
//        else if indexPath.row == 3 {
//            self.productViewController?.title = "Tesla (TSLA)"
//        }
        
        
    }
 
}

    
    

