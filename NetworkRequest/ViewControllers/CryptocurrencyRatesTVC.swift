//
//  CryptocurrencyRatesTVC.swift
//  NetworkRequest
//
//  Created by VG on 09.04.2022.
//

import UIKit
import Alamofire

class CryptocurrencyRatesTVC: UITableViewController {
    
    private var cryptocurrencies: [Cryptocurrency] = []
    private var spinnerView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinnerView = showSpinner(in: tableView)
//        sendRequest()
        alamofireGetRequest()
        
        title = "Cryptocurrency"
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptocurrencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RatesTableViewCell
        let cryptocurrency = cryptocurrencies[indexPath.row]
        cell.configure(with: cryptocurrency)
        
        cell.lowPriceLabel.textColor = #colorLiteral(red: 0.1137254902, green: 0.7294117647, blue: 0.1490196078, alpha: 1)
        cell.highPriceLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return cell
    }
    
    @IBAction func restartButton(_ sender: UIBarButtonItem) {
//        sendRequest()
        alamofireGetRequest()
        spinnerView?.startAnimating()
    }
    
//    private func sendRequest() {
//        NetworkManager.shared.fetchCryptocurrency { (cryptocurrencies) in
//            DispatchQueue.main.async {
//                self.spinnerView?.stopAnimating()
//                self.cryptocurrencies = cryptocurrencies
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    func alamofireGetRequest() {
        NetworkManager.shared.fetchDataWithAlamofire("https://api.wazirx.com/sapi/v1/tickers/24hr") { (result) in
            switch result {
            case .success(let cryptocurrencies):
                self.cryptocurrencies = cryptocurrencies
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func showSpinner(in view: UITableView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
