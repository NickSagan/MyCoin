//
//  CoinManager.swift
//  MyCoin
//
//  Created by Nick Sagan on 11.01.2022.
//

import Foundation

class CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "8394335E-2E9A-44EB-94C7-9060C5287800"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) -> String {
        let urlString = baseURL + currency + "?apikey=" + apiKey
        return performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) -> String {
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {print(error!); return}
            guard let safeData = data else {return}
            let value = self.parseJson(safeData)
            return value
        }
        task.resume()
    }
    
    func parseJson(_ data: Data) -> String {
        
    }
}
