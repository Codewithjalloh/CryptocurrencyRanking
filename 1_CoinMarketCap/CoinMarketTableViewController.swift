//
//  CoinMarketTableViewController.swift
//  1_CoinMarketCap
//
//  Created by Jalloh on 06/02/2018.
//  Copyright © 2018 Jalloh. All rights reserved.
//

import UIKit

class CoinMarketTableViewController: UITableViewController {
    
    var coinMarketDataArray = [CoinMarket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCoinJSON()
    }
    
    func getCoinJSON() {
        CoinMarket.getCoinCapJSONData { (results:[CoinMarket]?) in
            if let coinMarketData = results {
                self.coinMarketDataArray = coinMarketData
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coinMarketDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date!)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinCapTableViewCell

        // Configure the cell...
        
        let coinMarketObject = coinMarketDataArray[indexPath.row]
        
        cell.nameLabel.text = coinMarketObject.name
        cell.symbolLabel.text = coinMarketObject.symbol
        cell.rankLabel.text = coinMarketObject.rank
        return cell
    }
}
