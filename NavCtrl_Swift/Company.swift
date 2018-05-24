//
//  File.swift
//  NavCtrl_Swift
//
//  Created by swetha on 5/21/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import Foundation
class Company{
    
    let compName:String
    let compImg:String
    var products:[Product]
    
    
    init(compName:String,compImg:String) {
        self.compImg = compImg
        self.compName = compName
        self.products = [Product]()
        
    }
}
//protocol Companies {
//    
//}
    



