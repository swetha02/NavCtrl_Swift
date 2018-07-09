//
//  DAO.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/23/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit
import CoreData

class DAO{
    //    var companyentity = [NSManagedObject]()
    var companysList = [Company]()
    static let shared = DAO()
    var companyEntityList = [CompanyEntity]()
    
//   var context = NSManagedObjectContext()
//    
//    init() {
//        let appdelegate = UIApplication.shared.delegate as!AppDelegate
//        //         (key lets us access to coredata)
//        context = appdelegate.persistentContainer.viewContext
//    }
    
   
    
    
    func addCompany(company: Company) {
        companysList.append(company)
        createCompanyEntity(compName: company.compName, compImg: company.compImg, companyTicker: company.companyTicker, companyPrice: company.companyPrice!)
        //        companyEntityList.append(<#T##newElement: CompanyEntity##CompanyEntity#>)
        
    }
    
    func addProducts(product:Product, companyId: Int) {
        companysList[companyId].products.append(product)
        createProductEntity(productName: product.productName, productImg: product.productImg, productUrl: product.productUrl, companyId: companyId)
    }
    
    func updateProducts(product:Product,companyId: Int, productId: Int){
       
        
       let company =  companysList[companyId]
       let prod = company.products[productId]
  
        let oldProdName = prod.productName
        
        prod.productName =  product.productName
        prod.productImg = product.productImg
        prod.productUrl = product.productUrl
        
        
        
        
        
       let appdelegate = UIApplication.shared.delegate as!AppDelegate
       let context = appdelegate.persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
       fetchRequest.predicate = NSPredicate(format: "company.compName == %@ and productName == %@", company.compName, oldProdName)
       
        
       do {
            let results = try context.fetch(fetchRequest)
            let productEntity = results[0] as! ProductEntity
            productEntity.productName = product.productName
        
            try context.save()
            
            
        }catch{
            
            
        }

        
    }
    func editCompany (company: Company,companyId : Int){
        
        let existingCompany =  companysList[companyId]
        let oldCompName = existingCompany.compName


        existingCompany.compName = company.compName
        existingCompany.compImg = company.compImg
        existingCompany.companyTicker = company.companyTicker
        existingCompany.companyPrice = company.companyPrice
        
        let appdelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CompanyEntity")
        fetchRequest.predicate = NSPredicate(format: "compName == %@ ", oldCompName)
        
        do {
            let results = try context.fetch(fetchRequest)
            let companyentity = results[0] as! CompanyEntity
            companyentity.compName = company.compName
            
            try context.save()
            
            
        }catch{
            
            
        }
        
        
    }
        
   
    func createCompanys() {
        
        //        let apple = Company(compName: "Apple Inc", compImg:"apple.png", companyTicker: "AAPL",companyPrice:"price")
        //
        //        //      companysList.append(apple)
        //
        //        let google = Company(compName: "Google", compImg: "google.png", companyTicker: "GOOG",companyPrice:"price")
        //        //      companysList.append(google)
        //
        //        let tesla = Company(compName:"Tesla" , compImg:"tesla.png", companyTicker: "TSLA",companyPrice:"price")
        //        //      companysList.append(tesla)
        //
        //        let twitter = Company(compName: "Twitter", compImg: "twitter.png", companyTicker: "TWTR",companyPrice:"price")
        //        //      companysList.append(twitter)
        //
        //
        //        let ipad = Product(productName: "iPad", productImg: "apple.png", productUrl: "https://www.apple.com")
        //        apple.products.append(ipad)
        //        let ipod = Product(productName:"ipod", productImg: "apple.png",productUrl:"https://www.apple.com")
        //        apple.products.append(ipod)
        //        let iPhone = Product(productName: "iPhone", productImg: "apple.png", productUrl:"https://www.apple.com")
        //        apple.products.append(iPhone)
        //
        //        let galaxyS4 = Product(productName: "Galaxy S4", productImg:"google.png", productUrl:"https://www.rentalcars.com")
        //        google.products.append(galaxyS4)
        //        let galaxyNote = Product(productName: "Galaxy Note", productImg:"google.png", productUrl:"https://www.samsung.com")
        //        google.products.append(galaxyNote)
        //        let galaxyTab = Product(productName: "Galaxy Tab", productImg:"google.png", productUrl:"https://www.samsung.com")
        //        google.products.append(galaxyTab)
        //
        //        let teslamodel1  = Product(productName: "ModelX", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        //        tesla.products.append(teslamodel1 )
        //        let teslamodel2  = Product(productName: "Model S", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        //        tesla.products.append(teslamodel2)
        //        let teslamodel3  = Product(productName: "Model 3", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        //        tesla.products.append(teslamodel3)
        //
        //        let twitterS  = Product(productName: "Twitter Snap", productImg:"twitter.png", productUrl:"https://www.samsung.com")
        //        twitter.products.append(twitterS )
        //        let twitterW  = Product(productName: "Twitter Wiki", productImg:"twitter.png", productUrl:"https://www.twitter.com")
        //        twitter.products.append(twitterW )
        //        let twitterWW  = Product(productName: "Twitter Web", productImg:"twitter.png", productUrl:"https://www.twitter.com")
        //        twitter.products.append(twitterWW)
        
        
        
        
        
        
        
        //
        //        var products = apple.products
        //        print(apple.products.count)
        //        print(products.count)
        //        products.remove(at: 0)
        //        print(apple.products.count)
        //        print(products.count)
        //        apple.products.remove(at: 1)
        //        print(apple.products.count)
        //        print(products.count)
        
    }
    
    func toRetrieveData(){
        
        let appdelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CompanyEntity")
        
        companysList.removeAll()
        
        fetchRequest.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(fetchRequest)
            
            companyEntityList = results as![CompanyEntity]
            
            for data in results as![CompanyEntity]{
                
                //let companyName = data.value(forKey: "compName")as! String
                let companyName = data.compName!
                
                let compImg = data.value(forKey: "compImg") as! String
                let companyTicker = data.value(forKey: "companyTicker") as! String
                let companyPrice = data.value(forKey: "companyPrice")as! String
                
                let tempCompany = Company(compName:companyName , compImg:compImg, companyTicker: companyTicker, companyPrice: companyPrice)
                
                let resultsP = data.products?.allObjects
                
                for prod in resultsP as! [ProductEntity] {
                    let productName = prod.productName!
                    let productImage = prod.productImg!
                    let productUrl = prod.productUrl!
                    let tempProduct = Product(productName: productName, productImg: productImage, productUrl: productUrl)
                    tempCompany.products.append(tempProduct)
                }
                
                
                companysList.append(tempCompany)
            }
            
        }
        catch  {
            print("fail")
            
        }
        
    }
    
    
    func storeDemoCompanyData(){
        
        createCompanyEntity(compName: "Apple Inc", compImg: "http://t1.gstatic.com/images?q=tbn:ANd9GcSjoU2lZ2eJX3aCMfiFDt39uRNcDu9W7pTKcyZymE2iKa7IOVaI",companyTicker: "AAPL",companyPrice: "price")
        createCompanyEntity(compName: "Google", compImg: "https://upload.wikimedia.org/wikipedia/commons/0/04/Google_Plus_logo.png",companyTicker: "GOOG",companyPrice: "price")
        createCompanyEntity(compName: "Tesla", compImg: "http://www.carlogos.org/logo/Tesla-logo-2003-2500x2500.png", companyTicker: "TSLA", companyPrice: "price")
        createCompanyEntity(compName: "Twitter", compImg: "https://upload.wikimedia.org/wikipedia/de/thumb/9/9f/Twitter_bird_logo_2012.svg/154px-Twitter_bird_logo_2012.svg.png", companyTicker: "TWTR", companyPrice: "price")
        
        
        
        toRetrieveData()
        
        storedataOfProducts()
    }
    
    
    func createCompanyEntity(compName: String, compImg: String , companyTicker:String , companyPrice:String){
        
        let appdelegate = UIApplication.shared.delegate as!AppDelegate
        //         (key lets us access to coredata)
        let context = appdelegate.persistentContainer.viewContext
        
        
        //        let companyDetails = NSEntityDescription.insertNewObject(forEntityName: "CompanyEntity", into: context)
        
        let companyDetails = NSEntityDescription.insertNewObject(forEntityName: "CompanyEntity", into: context) as! CompanyEntity
        
        
        //
        //        create newuser
        //companyDetails.setValue(compName, forKey: "compName")
        companyDetails.compName = compName
        companyDetails.setValue(compImg, forKey: "compImg")
        companyDetails.setValue(companyTicker, forKey: "companyTicker")
        companyDetails.setValue(companyPrice, forKey: "companyPrice")
        
        companyEntityList.append(companyDetails)
        
        
        do {
            try context.save()
            print("saved")
            
        } catch  {
            
        }
        
        
    }
    
    func storedataOfProducts(){
        
        createProductEntity(productName: "ipad", productImg:"http://thesweetsetup.com/wp-content/uploads/2013/12/ticci-ipad-portrait_ipadmini_black_landscape.jpg" , productUrl: "https://www.apple.com", companyId: 0)
        createProductEntity(productName: "ipod", productImg: "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/ipod/ipodtouch/ipod-touch-5th-gen-second-release.png", productUrl: "https://www.apple.com", companyId: 0)
        createProductEntity(productName: "iPhone", productImg: "https://images.idgesg.net/images/article/2017/10/iphone-x-iphone-8-plus-100737887-orig.jpg", productUrl: "https://www.apple.com", companyId: 0)
        
        createProductEntity(productName: "Galaxy S4", productImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRfbQmPUk6m1qJyzYaUNwgvwXhKwh8t_QDyZfxa4skmvG9rvsA-Q", productUrl: "https://www.rentalcars.com", companyId: 1)
        createProductEntity(productName: "Galaxy Note", productImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRfbQmPUk6m1qJyzYaUNwgvwXhKwh8t_QDyZfxa4skmvG9rvsA-Q", productUrl: "https://www.samsung.com", companyId: 1)
        createProductEntity(productName: "Galaxy Tab", productImg: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRfbQmPUk6m1qJyzYaUNwgvwXhKwh8t_QDyZfxa4skmvG9rvsA-Q", productUrl: "https://www.samsung.com", companyId: 1)
        
        createProductEntity(productName: "ModelX", productImg: "https://png.icons8.com/ios/1600/tesla-model-x.png", productUrl: "https://www.tesla.com", companyId: 2)
        createProductEntity(productName: "Model S", productImg: "https://png.icons8.com/ios/1600/tesla-model-x.png", productUrl: "https://www.tesla.com", companyId: 2)
        createProductEntity(productName: "Model 3", productImg: "https://png.icons8.com/ios/1600/tesla-model-x.png", productUrl: "https://www.tesla.com", companyId: 2)
        
        createProductEntity(productName: "Twitter Snap", productImg: "https://cdn1.iconfinder.com/data/icons/somacro___dpi_social_media_icons_by_vervex-dfjq/500/twitter-old.png", productUrl: "https://www.samsung.com", companyId: 3)
        createProductEntity(productName: "Twitter Wiki", productImg: "https://cdn1.iconfinder.com/data/icons/somacro___dpi_social_media_icons_by_vervex-dfjq/500/twitter-old.png", productUrl: "https://www.twitter.com", companyId: 3)
        createProductEntity(productName: "Twitter Web", productImg: "https://cdn1.iconfinder.com/data/icons/somacro___dpi_social_media_icons_by_vervex-dfjq/500/twitter-old.png", productUrl: "https://www.twitter.com", companyId: 3)
        
        
    }
    
    func createProductEntity(productName: String, productImg: String, productUrl: String, companyId: Int){
        
        let appdelegate = UIApplication.shared.delegate as!AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let productDetails = NSEntityDescription.insertNewObject(forEntityName: "ProductEntity", into: context) as! ProductEntity
        
        productDetails.setValue(productName, forKey: "productName")
        productDetails.setValue(productImg, forKey: "productImg")
        productDetails.setValue(productUrl, forKey: "productUrl")
        
        companyEntityList[companyId].addToProducts(productDetails)
        
        
        do{
            try context.save()
            print("saved")
        } catch {
            
            print("error")
        }
        
    }
    
    
    func deleteCompany(index: Int) {
        
        companysList.remove(at: index)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let companyToDelete = self.companyEntityList[index]
        
        managedContext.delete(companyToDelete)
        do {
            try managedContext.save()
            companyEntityList.remove(at: index)
        } catch  {
            print("error")
        }
        
        
        
    }
    
    func deleteProducts(companyId: Int, productIndex: Int){
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appdelegate.persistentContainer.viewContext
        let company = companyEntityList[companyId]
        let allProducts = company.products?.allObjects as! [ProductEntity]
        
        companysList[companyId].products.remove(at: productIndex)
        
        do {
            companyEntityList[companyId].removeFromProducts(allProducts[productIndex])
            try managedContext.save()
        } catch  {
            print("error")
        }
        
        
        
    }
    
    func undo() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let context = appDelegate.persistentContainer.viewContext


        context.undoManager?.undo()
        toRetrieveData()
        
        do{
            try context.save()
            print("saved")
        } catch {
            
            print("error")
        }
    }
    
    func redu() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.undoManager?.redo()
        toRetrieveData()
        
        do{
            try context.save()
            print("saved")
        } catch {
            
            print("error")
        }
    }
    
    
}

//    func fetchProductData() -> Product?{
//
//        let appdelegate = UIApplication.shared.delegate as!AppDelegate
//        let context = appdelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductEntity")
//
//        fetchRequest.returnsObjectsAsFaults = false
//        do{
//            let results = try context.fetch(fetchRequest)
//            for data in results as![ProductEntity]{
//
//                //let companyName = data.value(forKey: "compName")as! String
//                let productName = data.productName!
//
//                let productImg = data.value(forKey: "productImg") as! String
//                let productUrl = data.value(forKey: "productUrl") as! String
//                let tempProduct =  Product(productName: productName, productImg: productImg, productUrl: productUrl)
////                print(tempProduct.productName)
////                return tempProduct
//            }
//
//        }
//        catch{
//            print("")
//        }
//        return nil
//    }



