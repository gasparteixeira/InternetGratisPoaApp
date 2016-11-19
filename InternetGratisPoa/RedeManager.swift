//
//  RedeManager.swift
//  InternetGratisPoa
//
//  Created by Gaspar on 12/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RedeManager: NSObject {
    
    func loadRedes(callback: @escaping(_ redes:[Rede]?, _ error: Error?) ->()) {
        Alamofire.request("http://www.portoalegrelivre.com.br/php/services/WSPoaLivreRedes.php").responseJSON { response
            in
            
            var redes = [Rede]()

            let json = JSON(response.result.value!)
 
            
            for(_, subJSON): (String, JSON) in json {
                
                let latiLong = Double(subJSON["Latitude"].string!)
                let longiLong = Double(subJSON["Longitude"].string!)
                
                let rede = Rede(empresa: subJSON["Empresa"].string,
                                nome: subJSON["NomeRede"].string,
                                endereco: subJSON["Endereco"].string,
                                latitude: latiLong,
                                longitude: longiLong,
                                setor: subJSON["Setor"].string)
                
                redes.append(rede)
            }
            
            callback(redes, json.error)
        }
    }
    
}
