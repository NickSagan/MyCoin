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
    
    func getCoinPrice(for currency: String) {
        let urlString = baseURL + currency + "?apikey=" + apiKey
        performRequest(urlString: urlString)
    }
    
}
