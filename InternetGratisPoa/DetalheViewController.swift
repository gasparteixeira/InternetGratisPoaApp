//
//  DetalheViewController.swift
//  InternetGratisPoa
//
//  Created by Gaspar on 15/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {
    
    var rede: Rede?

    @IBOutlet weak var lbNome: UILabel!
    @IBOutlet weak var lbEndereco: UILabel!
    @IBOutlet weak var lbEmpresa: UILabel!
    @IBOutlet weak var lbLatitude: UILabel!
    @IBOutlet weak var lbLongitude: UILabel!
    @IBOutlet weak var lbSetor: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detalhes da Rede"
        carregarDetalhes()
        
    }
    
    func carregarDetalhes() {
        if let ponto = rede {
            if let nome = ponto.nome {
                lbNome.text = "Nome: \(nome)"
            } else {
                lbNome.text = "Nome não informado"
            }
            
            if let endereco = ponto.endereco {
                lbEndereco.text = "Endereço: \(endereco)"
            } else {
                lbEndereco.text = "Endereço não informado"
            }
            
            if let empresa = ponto.empresa {
                lbEmpresa.text = "Empresa: \(empresa)"
            } else {
                lbEmpresa.text = "Empresa não informada"
            }
            
            if let latitude = ponto.latitude {
                lbLatitude.text = "Latitude: \(latitude)"
            } else {
                lbLatitude.text = "Latitude não informada"
            }
            
            if let longitude = ponto.longitude {
                lbLongitude.text = "Longitude: \(longitude)"
            } else {
                lbLongitude.text = "Longitude não informada"
            }
            
            if let setor = ponto.setor {
                lbSetor.text = "Setor: \(setor)"
            } else {
                lbSetor.text = "Setor não informado"
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
