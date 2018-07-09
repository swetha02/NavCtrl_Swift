//
//  File.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/21/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import Foundation
class Company{
    
    var compName:String
    var compImg:String
    var companyTicker: String
    var companyPrice: String?
    var products:[Product]

    init(compName:String,compImg:String, companyTicker: String,companyPrice:String) {
        self.compImg = compImg
        self.compName = compName
        self.companyTicker = companyTicker
        self.companyPrice = companyPrice
        self.products = [Product]()
        
    }
}
//protocol Companies {
//    
//}




