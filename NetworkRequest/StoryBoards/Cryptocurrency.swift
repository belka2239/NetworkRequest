//
//  Cryptocurrency.swift
//  NetworkRequest
//
//  Created by VG on 09.04.2022.
//

struct Cryptocurrency: Decodable {
    let symbol: String?
    let openPrice: String?
    let lowPrice: String?
    let highPrice: String?
    
    init(cryptocurrenciesData: [String: Any]) {
        symbol = cryptocurrenciesData["symbol"] as? String
        openPrice = cryptocurrenciesData["openPrice"] as? String
        lowPrice = cryptocurrenciesData["lowPrice"] as? String
        highPrice = cryptocurrenciesData["highPrice"] as? String
    }
    
    static func getCryptocurrency(from value: Any) -> [Cryptocurrency] {
        guard let cryptocurrenciesData = value as? [[String: Any]] else { return [] }
        return cryptocurrenciesData.compactMap { Cryptocurrency(cryptocurrenciesData: $0) }
    }
}
