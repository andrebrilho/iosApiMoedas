//
//  MoedaValores.swift
//  MoedaApi
//
//  Created by André Brilho on 27/08/2018.
//  Copyright © 2018 André Brilho. All rights reserved.
//

import Foundation

class MoedaValores: Codable {
    
    var usd:Moeda!
    var eur:Moeda!
    var ars:Moeda!
    var gbp:Moeda!
    var btc:Moeda!
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case ars = "ARS"
        case gbp = "GBP"
        case btc = "BTC"
    }
    
}

