//
//  TableViewController.swift
//  InternetGratisPoa
//
//  Created by Gaspar on 12/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var redes = [Rede]()
    
    func loadData() {
        let redeManager = RedeManager()
        
        redeManager.loadRedes{ (redes, error) in
            if error == nil {
                if let array = redes {
                    self.redes = array
                }
                self.tableView.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tabela de Redes"
        self.loadData()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return redes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let rede = redes[indexPath.row]
        cell.textLabel?.text  = rede.nome
        cell.detailTextLabel?.text = rede.endereco
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if segue.identifier == "showMapa" {
            let destination = segue.destination as? MapaViewController
            if let IndexPath = self.tableView.indexPathForSelectedRow?.row {
                destination?.rede = self.redes[IndexPath]
            }
        }
    }
    

}
