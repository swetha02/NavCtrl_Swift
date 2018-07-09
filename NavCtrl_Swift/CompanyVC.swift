//
//  CompanyVC.swift
//  NavCtrl_Swift
//
//  Created by Jesse Sahli on 2/22/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

import UIKit
import CoreData

class CompanyVC: UIViewController {
    
    @IBOutlet weak var undoBtn: UIButton!
    @IBOutlet weak var redoBtn: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func UndoButtn(_ sender: Any) {
        DAO.shared.undo()
        tableView.reloadData()
    }
    
    
    
    @IBAction func RedoButtn(_ sender: Any) {
        DAO.shared.redu()
        tableView.reloadData()
    }
    //
    //    var companyList : [String]?
    
    //    var companyImages : [String]()
    
    // var companysList = [Company]()
    var productViewController : ProductVC?
    var editComp : EditCompany?
    var addVc :AddViewController?
    var prod : AddProductViewC?
    let  dao = DAO.shared
    var isEditMode = false
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dao.createCompanys()
        
        if !isEditMode {
            undoBtn.isHidden = true
            redoBtn.isHidden = true
        }
        
        if UserDefaults.standard.bool(forKey: "DefaultDataCreated") != true {
            dao.storeDemoCompanyData()
            UserDefaults.standard.set(true, forKey: "DefaultDataCreated")
        }
        
        dao.toRetrieveData()
        
        //        self.companyList = ["Apple Inc (APPL)","Google (GOOG)","Twitter (TWTR)","Tesla (TSLA)"]
        //
        //        self.companyImages = ["apple.png","google.png","twitter.png","tesla.png"]
        //
        //create edit button
        let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditMode))
        self.navigationItem.leftBarButtonItem = editBarButton
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white

        
        //        color
        self.navigationController?.navigationBar.barTintColor = UIColor .green
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        //        create add button
        let addBarButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addButtnAction))
        self.navigationItem.rightBarButtonItem = addBarButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        //        title
        self.title = "Watch List"
        
    }
    
    //  creating add button
    
    
    @objc func addButtnAction(){
        
        self.addVc = AddViewController()
        
        self.navigationController?.pushViewController(self.addVc!, animated: true)
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        companysList = DAO.shared.companysList
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleEditMode() {
        if self.navigationItem.leftBarButtonItem?.title == "Edit" {
            self.tableView.setEditing(true, animated: true)
            self.navigationItem.leftBarButtonItem?.title = "Done"

        } else {
            self.tableView.setEditing(false, animated: true)
            self.navigationItem.leftBarButtonItem?.title = "Edit"

        }
        
        if isEditMode {
            undoBtn.isHidden = true
            redoBtn.isHidden = true
            isEditMode = !isEditMode
        } else {
            undoBtn.isHidden = false
            redoBtn.isHidden = false
            isEditMode = !isEditMode
        }
    }
}

// MARK: delegate & datasource methods

extension CompanyVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if dao.companysList.count > 0 {
            return dao.companysList.count
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
            dao.deleteCompany(index: indexPath.row)
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
        let items = dao.companysList[sourceIndexPath.row]
        dao.companysList.remove(at: sourceIndexPath.row)
        dao.companysList.insert(items, at: destinationIndexPath.row)
        
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
        
        let currentCompany = dao.companysList[indexPath.row]
        
        if(currentCompany.companyPrice == "price"){
            StockDataService().stockPrice(company:currentCompany, tableView: tableView)
            
        }
        
        
        if isValidURL(url: currentCompany.compImg) {
            let url = URL(string: currentCompany.compImg)
            
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: data)
                    }
                } catch {
                    print("No data!")
                }
            }
        } else {
            cell.imageView?.image = UIImage(named: currentCompany.compImg)
        }
        
        cell.textLabel?.text = "\(currentCompany.compName) (\(currentCompany.companyTicker))"
        
        cell.detailTextLabel?.text = "$ \( currentCompany.companyPrice ?? "%.2f")"
        
        return cell
        
        
    }
    
    func isValidURL(url: String) -> Bool {
        
        if let url = URL(string: url) {
            
            return UIApplication.shared.canOpenURL(url)
        }
        
        return false
    }
    
    
    // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if self.navigationItem.leftBarButtonItem?.title == "Done" {
            print("Edit Mode")
            self.editComp = EditCompany()
            let editMode = dao.companysList[indexPath.row]
            editComp?.company = editMode
            editComp?.companyID = indexPath.row
            self.navigationController?.pushViewController(self.editComp!, animated: true)
            
        } else {
            
            print("Non Edit Mode")
            self.productViewController = ProductVC()
            let company = dao.companysList[indexPath.row]
            productViewController?.company = company
            productViewController?.companyID = indexPath.row
            self.navigationController?.pushViewController(self.productViewController!, animated: true)

        
        
        }
        
        
        
        
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




