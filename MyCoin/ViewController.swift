//
//  ViewController.swift
//  MyCoin
//
//  Created by Nick Sagan on 08.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()

    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}

//MARK: - PickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
        bitcoinLabel.text = coinManager.currencyArray[row]
    }
}
