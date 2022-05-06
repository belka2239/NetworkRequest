//
//  RatesTableViewCell.swift
//  NetworkRequest
//
//  Created by VG on 09.04.2022.
//

import UIKit

class RatesTableViewCell: UITableViewCell {
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    @IBOutlet weak var lowPriceLabel: UILabel!
    @IBOutlet weak var highPriceLabel: UILabel!
    
    func configure(with cryptocurrency: Cryptocurrency) {
        symbolLabel.text = cryptocurrency.symbol
        openPriceLabel.text = "\(cryptocurrency.openPrice ?? 0)"
        lowPriceLabel.text = "\(cryptocurrency.lowPrice ?? 0)"
        highPriceLabel.text = "\(cryptocurrency.highPrice ?? 0)"
    }
}
