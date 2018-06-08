//
//  DAO.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/23/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import Foundation

class DAO{
     
    var companysList = [Company]()
    
    static let shared = DAO()
    
    func addCompany(company: Company) {
        companysList.append(company)
    }
    
    func addProducts(product:Product, companyId: Int) {
      companysList[companyId].products.append(product)
    }
    
    func createCompanys() {
        let apple = Company(compName: "Apple Inc", compImg:"apple.png", companyTicker: "AAPL",companyPrice:"price")
        
        companysList.append(apple)
        
        let google = Company(compName: "Google", compImg: "google.png", companyTicker: "GOOG",companyPrice:"price")
        companysList.append(google)
        let twitter = Company(compName: "Twitter", compImg: "twitter.png", companyTicker: "TWTR",companyPrice:"price")
        companysList.append(twitter)
        let tesla = Company(compName:"Tesla" , compImg:"tesla.png", companyTicker: "TSLA",companyPrice:"price")
        companysList.append(tesla)
        
        let ipad = Product(productName: "iPad", productImg: "apple.png", productUrl: "https://www.apple.com")
        apple.products.append(ipad)
        
        let ipod = Product(productName:"ipod", productImg: "apple.png",productUrl:"https://www.apple.com")
        apple.products.append(ipod)
        let iPhone = Product(productName: "iPhone", productImg: "apple.png", productUrl:"https://www.apple.com")
        apple.products.append(iPhone)
        
        let galaxyS4 = Product(productName: "Galaxy S4", productImg:"google.png", productUrl:"https://www.rentalcars.com")
        google.products.append(galaxyS4)
        let galaxyNote = Product(productName: "Galaxy Note", productImg:"google.png", productUrl:"https://www.samsung.com")
        google.products.append(galaxyNote)
        let galaxyTab = Product(productName: "Galaxy Tab", productImg:"google.png", productUrl:"https://www.samsung.com")
        google.products.append(galaxyTab)
        
        
        
        let twitterS  = Product(productName: "Twitter Snap", productImg:"twitter.png", productUrl:"https://www.samsung.com")
        twitter.products.append(twitterS )
        let twitterW  = Product(productName: "Twitter Wiki", productImg:"twitter.png", productUrl:"https://www.twitter.com")
        twitter.products.append(twitterW )
        let twitterWW  = Product(productName: "Twitter Web", productImg:"twitter.png", productUrl:"https://www.twitter.com")
        twitter.products.append(twitterWW)
        
        
        let teslamodel1  = Product(productName: "ModelX", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        tesla.products.append(teslamodel1 )
        let teslamodel2  = Product(productName: "Model S", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        tesla.products.append(teslamodel2)
        let teslamodel3  = Product(productName: "Model 3", productImg:"tesla.png", productUrl:"https://www.tesla.com")
        tesla.products.append(teslamodel3)
        
        
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
    
}
