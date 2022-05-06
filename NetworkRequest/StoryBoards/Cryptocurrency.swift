//
//  Cryptocurrency.swift
//  NetworkRequest
//
//  Created by VG on 09.04.2022.
//

//struct CryptocurrencyDescription: Decodable {
//    let cryptocurrency: [Cryptocurrency]
//}

struct Cryptocurrency: Decodable {
    let symbol: String?
    let openPrice: Float?
    let lowPrice: Float?
    let highPrice: Float?
}
