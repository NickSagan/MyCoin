//
//  CoinManager.swift
//  MyCoin
//
//  Created by Nick Sagan on 11.01.2022.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinPrice(coinPrice: Double)
}

class CoinManager {
    var delegate: CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "8394335E-2E9A-44EB-94C7-9060C5287800"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + currency + "?apikey=" + apiKey
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        // 1. Create a URL
        if let url = URL(string: urlString){
            // 2. Create a URL session (it's like a browser)
            let urlSession = URLSession(configuration: .default)
            // 3. give the session a task (it's like inputing url in a browser)
            let task = urlSession.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let coinPrice = self.parseJSON(coinData: safeData){
                        print("Parsed: \(coinPrice)")
                        self.delegate?.didUpdateCoinPrice(coinPrice: coinPrice)
                    }
                    else{
                        print("parseJSON error")
                        return
                    }
                }
            }
            // 4. Start a task. It's like pushing the Enter
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            return decodedData.rate
        }
        catch {
            print(error)
            return nil
        }
    }
}
