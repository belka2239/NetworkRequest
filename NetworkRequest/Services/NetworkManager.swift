//
//  NetworkManager.swift
//  NetworkRequest
//
//  Created by VG on 08.05.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCryptocurrency(_ completion: @escaping ([Cryptocurrency]) -> Void) {
       
        let jsonURL = "https://api.wazirx.com/sapi/v1/tickers/24hr"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let cryptocurrencies = try JSONDecoder().decode([Cryptocurrency].self, from: data)
                completion(cryptocurrencies)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()

    }
}
