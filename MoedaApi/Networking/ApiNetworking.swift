//
//  ApiNetworking.swift
//  MoedaApi
//
//  Created by André Brilho on 27/08/2018.
//  Copyright © 2018 André Brilho. All rights reserved.
//

import Foundation

class ApiNeworking: NSObject {
    
    static func fetchValoresMoeda(completion: @escaping ((MoedaValores?) -> Void)) {
        let url = URL(string: "https://api.promasters.net.br/cotacao/v1/valores")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                completion(nil)
                print("erro ao acesso JSON")
            }else{
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(MoedaResponse.self, from: data)
                        completion(json.valores)
                        print(json.valores.eur.valor)
                    }catch{
                        print("error para parsear objeto")
                        completion(nil)
                        
                    }
                }
            }
            
            }.resume()
    }
}
