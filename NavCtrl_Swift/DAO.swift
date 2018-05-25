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
    
    
    func createCompanys() {
        let apple = Company(compName: "Apple Inc (APPL)", compImg:"apple.png" )
        companysList.append(apple)
        let google = Company(compName: "Google (GOOG)", compImg: "google.png")
        companysList.append(google)
        let twitter = Company(compName: "Twitter (TWTR)", compImg: "twitter.png")
        companysList.append(twitter)
        let tesla = Company(compName:"Tesla (TSLA)" , compImg:"tesla.png" )
        companysList.append(tesla)
        
        let ipad = Product(productName: "iPad", productImg: "apple.png", productTitle: "Apple Inc (APPL)",productUrl: "https://www.apple.com")
        apple.products.append(ipad)
        let ipod = Product(productName:"ipod", productImg: "apple.png", productTitle: "Apple Inc (APPL)",productUrl:"https://www.apple.com")
        apple.products.append(ipod)
        let iPhone = Product(productName: "iPhone", productImg: "apple.png", productTitle: "Apple Inc (APPL)",productUrl:"https://www.apple.com")
        apple.products.append(iPhone)
        
        let galaxyS4 = Product(productName: "Galaxy S4", productImg:"google.png", productTitle: "Google (GOOG)",productUrl:"https://www.rentalcars.com")
        google.products.append(galaxyS4)
        let galaxyNote = Product(productName: "Galaxy Note", productImg:"google.png", productTitle: "Google (GOOG)",productUrl:"https://www.samsung.com")
        google.products.append(galaxyNote)
        let galaxyTab = Product(productName: "Galaxy Tab", productImg:"google.png", productTitle: "Google (GOOG)",productUrl:"https://www.samsung.com")
        google.products.append(galaxyTab)
        
        
        
        let twitterS  = Product(productName: "Twitter Snap", productImg:"twitter.png", productTitle: "Twitter (TWTR)",productUrl:"https://www.samsung.com")
        twitter.products.append(twitterS )
        let twitterW  = Product(productName: "Twitter Wiki", productImg:"twitter.png", productTitle: "Twitter (TWTR)",productUrl:"https://www.twitter.com")
        twitter.products.append(twitterW )
        let twitterWW  = Product(productName: "Twitter Web", productImg:"twitter.png", productTitle: "Twitter (TWTR)",productUrl:"https://www.twitter.com")
        twitter.products.append(twitterWW)
        
        
        let teslamodel1  = Product(productName: "ModelX", productImg:"tesla.png", productTitle: "Tesla (TSLA)",productUrl:"https://www.tesla.com")
        tesla.products.append(teslamodel1 )
        let teslamodel2  = Product(productName: "Model S", productImg:"tesla.png", productTitle: "Tesla (TSLA)",productUrl:"https://www.tesla.com")
        tesla.products.append(teslamodel2)
        let teslamodel3  = Product(productName: "Model 3", productImg:"tesla.png", productTitle: "Tesla (TSLA)",productUrl:"https://www.tesla.com")
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
