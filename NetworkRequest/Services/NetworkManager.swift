//
//  NetworkManager.swift
//  NetworkRequest
//
//  Created by VG on 05.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
   
    private var cryptocurrencies: [Cryptocurrency] = []
    
    func fetchCryptocurrency() {
        let jsonURL = "https://api.wazirx.com/sapi/v1/tickers/24hr"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.cryptocurrencies = try JSONDecoder().decode([Cryptocurrency].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
}
