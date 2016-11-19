//
//  CollectionViewController.swift
//  InternetGratisPoa
//
//  Created by Gaspar on 12/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"


class CollectionViewController: UICollectionViewController {
    
    var redes = [Rede]()
    
    func loadData() {
        let redeManager = RedeManager()
        
        redeManager.loadRedes{ (redes, error) in
            if error == nil {
                if let array = redes {
                    self.redes = array
                }
                self.collectionView!.reloadData()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        loadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMapa" {
            let destination = segue.destination as? MapaViewController
//            let cell = sender as! CollectionViewCell
//            let index = self.collectionView?.indexPath(for: cell)
            destination?.rede = sender as? Rede //self.redes[(index?.row)!]
        }
    }
    

    // MARK: UICollectionViewDataSource

    /*override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return redes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        let rede = redes[indexPath.row]
        cell.lblName?.text = rede.nome
 
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //var cell = collectionView.cellForItem(at: indexPath)
        self.performSegue(withIdentifier: "showMapa", sender: redes[indexPath.row])
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    } */
 
    /*override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
            self.performSegue(withIdentifier: "showMapa", sender:  redes[indexPath.row])
    }*/
 

}
