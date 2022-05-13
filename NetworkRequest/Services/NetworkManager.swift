//
//  NetworkManager.swift
//  NetworkRequest
//
//  Created by VG on 08.05.2022.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
//    func fetchCryptocurrency(_ completion: @escaping ([Cryptocurrency]) -> Void) {
//       
//        let jsonURL = "https://api.wazirx.com/sapi/v1/tickers/24hr"
//        guard let url = URL(string: jsonURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let cryptocurrencies = try JSONDecoder().decode([Cryptocurrency].self, from: data)
//                completion(cryptocurrencies)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    
    func fetchDataWithAlamofire(_ url: String, completion: @escaping(Result<[Cryptocurrency], NetworkError>) -> Void) {
        AF.request("https://api.wazirx.com/sapi/v1/tickers/24hr")
            .validate()
            .responseJSON { (dataResponse) in
                switch dataResponse.result {
                case .success(let value):
                    let cryptocurrencies = Cryptocurrency.getCryptocurrency(from: value)
                    DispatchQueue.main.async {
                        completion(.success(cryptocurrencies))
                    }
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
    }
}
