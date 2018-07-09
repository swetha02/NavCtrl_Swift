//
//  ProductVC.swift
//  NavCtrl_Swift
//
//  Created by Jesse Sahli on 2/22/17.
//  Copyright © 2017 turntotech. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {
    
    
    @IBOutlet weak var prodView: UIView!
    
    @IBOutlet weak var prodLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var products = [Product]()
    var company: Company?
    var addvc : AddViewController?
    var companyID: Int?
    var addProdView:AddProductViewC?
    
    //    var productImage : [String]?
    var webView = VCtrlWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      self.products.remove(at: 1)
        
        //        let dao = DAO.shared.productEntityList
        
        
        
        //      self.productImage = ["apple.png","google.png","twitter.png","tesla.png"]
        //        let editBarButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditMode))
        //        self.navigationItem.rightBarButtonItem = editBarButton
        //
        
        ////        create add button
        
        let addBarButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addButtnAction))
        self.navigationItem.rightBarButtonItem = addBarButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        
        //        create backButton
        
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
    
    
    @objc func addButtnAction(){
        self.addProdView = AddProductViewC()
        self.addProdView?.companyId = self.companyID
        self.navigationController?.pushViewController(self.addProdView!, animated: true)
        
    }
    
    
    @IBAction func Back(_sender:AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func loadIMg(url : String) {
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
        if let company = company {
            title = company.compName
            prodLabel.text = "\(company.compName)(\(company.companyTicker))"
            
            if isValidURL(url: company.compImg) {
                let url = URL(string: company.compImg)
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.imgView.image = UIImage(data: data!)
                    }
                }
            } else {
                imgView.image = UIImage(named: company.compImg)
            }
        }
    }
    
    func isValidURL(url: String) -> Bool {
        
        if let url = URL(string: url) {
            
            return UIApplication.shared.canOpenURL(url)
        }
        
        return false
    }
    
    //        let dao = DAO.shared.companysList
    //
    //
    //        if self.title == "Apple Inc (APPL)" {
    //            self.products = ["iPad", "iPod Touch", "iPhone"]
    //            self.productImage = ["apple.png","apple.png","apple.png"]
    //        } else if self.title == "Google (GOOG)" {
    //            self.products = ["Galaxy S4", "Galaxy Note", "Galaxy Tab"]
    //            self.productImage = ["google.png","google.png","google.png"]
    //        }
    //        else if self.title == "Twitter (TWTR)" {
    //            self.products = ["tweet", "access", "display"]
    //            self.productImage = ["twitter.png","twitter.png","twitter.png"]
    //        }
    //        else if self.title == "Tesla (TSLA)" {
    //            self.products = ["battery", "model", "speed"]
    //            self.productImage = ["tesla.png","tesla.png","tesla.png"]
    //        }
    //       self.tableView.reloadData()
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func toggleEditMode() {
        if self.navigationItem.rightBarButtonItem?.title == "Edit" {
            self.tableView.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Done"
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            self.tableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem?.title = "Edit"
        }
    }
}




extension ProductVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if company!.products.count > 0 {
            return company!.products.count
        } else {
            print("unknown number of rows... \"products\" property is nil!")
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier)
        
        if isValidURL(url: company!.products[indexPath.row].productImg) {
            let url = URL(string: company!.products[indexPath.row].productImg)
        
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data!)
                    tableView.reloadData()
                }
            }
        } else {
            cell.imageView?.image = UIImage(named: company!.products[indexPath.row].productImg)
        }
        //configure the cell
        cell.textLabel?.text = self.company!.products[indexPath.row].productName
        
        
        return cell
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return NO if you do not want the specified item to be editable.
     return true
     }
     */
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
            
            DAO.shared.deleteProducts(companyId: companyID!, productIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        else if editingStyle == .insert{
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    /*
     // Override to support rearranging the table view.
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
     
     }
     */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let items = company!.products[sourceIndexPath.row]
        company!.products.remove(at: sourceIndexPath.row)
        company!.products.insert(items, at: destinationIndexPath.row)
        
    }
    
    /*
     // Override to support conditional rearranging of the table view.
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return NO if you do not want the item to be re-orderable.
     return true
     }
     */
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    
    
    
    
    
    
    
    
    /*
     // In a xib-based application, navigation from a table can be handled in didSelectRowAt..
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     // Navigation logic may go here, for example:
     // Create the next view controller.
     let detailViewController = DetailVC()
     
     // Pass the selected object to the new view controller.
     
     // Push the view controller.
     self.navigationController?.pushViewController(detailViewController, animated: true)
     
     
     
     }
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        let url = self.company!.products[indexPath.row].productUrl
        
        self.webView.productUrl = url
        webView.product = self.company!.products[indexPath.row]
        webView.productId = indexPath.row
        webView.companyId = companyID
        
        self.navigationController?.pushViewController(self.webView, animated: true)
        
        
    }
    
    
    
    
    
    
    
}

