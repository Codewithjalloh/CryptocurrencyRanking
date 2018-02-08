//
//  CoinMarket.swift
//  1_CoinMarketCap
//
//  Created by Jalloh on 06/02/2018.
//  Copyright © 2018 Jalloh. All rights reserved.
//

import Foundation


struct CoinMarket {
    let name: String
    let symbol: String
    let rank: String
    
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let name = json["name"] as? String else { throw SerializationError.missing("name is missing")}
        
        guard let symbol = json["symbol"] as? String else { throw SerializationError.missing("name is missing")}
        
        guard let rank = json["rank"] as? String  else { throw SerializationError.missing("rank is missing")}
     
        self.name = name
        self.symbol = symbol
        self.rank = rank
    }
    
    static let basePath = "https://api.coinmarketcap.com/v1/ticker/"
    
    static func getCoinCapJSONData(completion: @escaping ([CoinMarket]?) -> ()) {
        
        let url = basePath
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var coinMarketArray:[CoinMarket] = []
            
            do {
                
                if let data = data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                        
                        for coinData in json {
                            if let singleCoin = try? CoinMarket(json: coinData) {
                                coinMarketArray.append(singleCoin)
                                
                                print(singleCoin)
                            }
                        }
                        
                    }
                    
                    
                }
                
                
            } catch {
                
                // catch internet connection failure
                
                
                print(error.localizedDescription)
            }
            completion(coinMarketArray)
            
            
            
           
        }
        task.resume()
    }
    
}
