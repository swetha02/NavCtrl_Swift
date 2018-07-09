//
//  Stock.swift
//  NavCtrl_Swift
//
//  Created by swetha on 6/4/18.
//  Copyright © 2018 turntotech. All rights reserved.
//

import UIKit
class StockDataService {
    
    func stockPrice(company:Company, tableView: UITableView) {
    //func stockPrice(ticker:String) {
//        let currency = "$"
               let urlString = "https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=\( company.companyTicker)&apikey=0I8RBCXA8AU5TZDZ"
        
      //  print(urlString)
        print("URL: \(urlString)" )
      
        
//        https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=AAPL&outputsize=full&apikey=0I8RBCXA8AU5TZDZ
//
        // https://www.alphavantage.co/query?function=BATCH_STOCK_QUOTES&symbols=AAPL&apikey=0I8RBCXA8AU5TZDZ

            guard let url = URL(string: urlString) else {return}
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if (error != nil) {
//do somthing with error
                    print("")
                
                } else {
                    if let metaData = data{
                        let json = try? JSONSerialization.jsonObject(with: metaData, options: .allowFragments) as! [String:AnyObject]
                        
                        guard let stockquote = json!["Stock Quotes"] as? [AnyObject] else {
                            
                            return
                        }
                                                
                        guard stockquote.count > 0 else {
                            DispatchQueue.main.async {
                                tableView.reloadData()
                            }
                            company.companyPrice = "N/A right now!"
                            return
                        }
                    
                        let value = stockquote[0] as! [String:AnyObject]
                        
                        let price = value["2. price"] as! String
                        
                        company.companyPrice = price
                        
                        print("\(company.compName) \(company.companyPrice!)")
                        DispatchQueue.main.async {
                            tableView.reloadData()
                        }
                    } else {
                        print("DATA ERRRRRRR")
                    }
            }
   
        }
    dataTask.resume()
}
}

//[[[https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=\(ticker)&outputsize=full&apikey=0I8RBCXA8AU5TZDZ

//if let metaData = data{
//    var json = try? JSONSerialization.jsonObject(with: metaData, options: .allowFragments) as![String:AnyObject]
//    let timeSeries = json!["Time Series (Daily)"] as! [String:AnyObject]
//    let Date = timeSeries["2018-06-08"] as! [String:AnyObject]
//    let openValue = Date["1. open"] as! String
//    print(openValue)]]]


