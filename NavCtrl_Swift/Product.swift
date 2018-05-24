//
//  ProductClass.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/21/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import Foundation

class Product {
    let productName:String
    let productImg:String
    let productUrl:String
    
    init(productName:String,productImg:String,productTitle:String,productUrl:String) {
        self.productName = productName
        self.productImg = productImg
        self.productUrl = productUrl
    }
}
