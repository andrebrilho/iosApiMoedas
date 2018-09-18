//
//  ViewController.swift
//  MoedaApi
//
//  Created by André Brilho on 27/08/2018.
//  Copyright © 2018 André Brilho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var lblValorMoeda: UILabel!
    @IBOutlet weak var lblDataConsulta: UILabel!
    @IBOutlet weak var actindicator: UIActivityIndicatorView!
    
    @IBOutlet weak var actIndicator2: UIActivityIndicatorView!
    
    
    var moedaValores:MoedaValores!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        callApi()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.consigureUI()
            self.actindicator.isHidden = true
            self.actIndicator2.isHidden = true
        }
    }
    
    func showUI(){
        segmentControl.isEnabled = true
        lblValorMoeda.isHidden = false
        lblDataConsulta.isHidden = false
    }
    
    
    @IBAction func SegmenMoedaChangesValues(_ sender: Any) {
     
        consigureUI()
    }
    
    func consigureUI(){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy - HH:mm"
        
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.currencySymbol = "R$ "
            numberFormatter.currencyDecimalSeparator = ","
            numberFormatter.currencyGroupingSeparator = "."
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            lblValorMoeda.text = numberFormatter.string(from: moedaValores.usd.valor as NSNumber)
            lblDataConsulta.text = dateFormater.string(from: Date(timeIntervalSince1970: moedaValores.usd.ultima_consulta))
        case 1:
            lblValorMoeda.text = numberFormatter.string(from: moedaValores.eur.valor as NSNumber)
            lblDataConsulta.text = dateFormater.string(from: Date(timeIntervalSince1970: moedaValores.eur.ultima_consulta))
        case 2:
            lblValorMoeda.text = numberFormatter.string(from: moedaValores.gbp.valor as NSNumber)
            lblDataConsulta.text = dateFormater.string(from: Date(timeIntervalSince1970: moedaValores.gbp.ultima_consulta))
        case 3:
            lblValorMoeda.text = numberFormatter.string(from: moedaValores.btc.valor as NSNumber)
            lblDataConsulta.text = dateFormater.string(from: Date(timeIntervalSince1970: moedaValores.btc.ultima_consulta))
        default:
            lblValorMoeda.text = numberFormatter.string(from: moedaValores.ars.valor as NSNumber)
            lblDataConsulta.text = dateFormater.string(from: Date(timeIntervalSince1970: moedaValores.ars.ultima_consulta))
        }
        
    }
    
    func callApi(){
        ApiNeworking.fetchValoresMoeda { (moedaValores) in
            if let moedaValores = moedaValores{
                self.moedaValores = moedaValores
                DispatchQueue.main.async {
                    self.showUI()
                }
            }else{
                print("erro to call api")
                self.actindicator.isHidden = true
                self.actIndicator2.isHidden = true
            }
        }
    }

}

