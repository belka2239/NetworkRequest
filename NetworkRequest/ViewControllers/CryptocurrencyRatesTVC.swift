//
//  CryptocurrencyRatesTVC.swift
//  NetworkRequest
//
//  Created by VG on 09.04.2022.
//

import UIKit

class CryptocurrencyRatesTVC: UITableViewController {
    
    private var cryptocurrencies: [Cryptocurrency] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cryptocurrency"
        
        fetchCryptocurrency()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptocurrencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RatesTableViewCell
        let cryptocurrency = cryptocurrencies[indexPath.row]
        cell.configure(with: cryptocurrency)
        return cell
    }
}

// MARK: - Networking
extension CryptocurrencyRatesTVC {
    private  func fetchCryptocurrency() {
        let jsonURL = "https://api.wazirx.com/sapi/v1/tickers/24hr"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let cryptocurrencies = try JSONDecoder().decode([Cryptocurrency].self, from: data)
                DispatchQueue.main.async {
                    self.cryptocurrencies = cryptocurrencies
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

