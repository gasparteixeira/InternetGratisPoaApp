//
//  MapaViewController.swift
//  InternetGratisPoa
//
//  Created by Gaspar on 12/11/16.
//  Copyright © 2016 Gaspar Teixeira. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate{
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    var rede: Rede?
    var annotation: MKPointAnnotation!
    
    func addMapAnnotation() {
        if let ponto = rede {
            let latDelta: CLLocationDegrees = 0.09
            let lonDelta: CLLocationDegrees = 0.09
            
            let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
            let location = CLLocationCoordinate2D(latitude: ponto.latitude!, longitude: ponto.longitude!)
            
            annotation = MKPointAnnotation()
            annotation.coordinate = location
            
            if let nomedarede = ponto.nome {
                annotation.title = "Rede: \(nomedarede)"
            } else {
                annotation.title = "Rede: - "
            }
            
            if let enderecorede = ponto.endereco {
                annotation.subtitle = "Endereço: \(enderecorede)"
            } else {
                annotation.subtitle = "Endereço: - "
            }
            
            let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            mapView.setRegion(region, animated: true)
            
            
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let pinAnnotationview = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            
            pinAnnotationview.pinTintColor = .purple
            pinAnnotationview.isDraggable = true
            pinAnnotationview.canShowCallout = true
            pinAnnotationview.animatesDrop = true
            pinAnnotationview.rightCalloutAccessoryView = UIButton.init(type: .detailDisclosure) as UIButton
            
            return pinAnnotationview
        }
        return nil
    }
    
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        self.mapView.addAnnotation(annotation)
    }
    
    //mapaDetalhe
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "mapaDetalhe", sender: rede)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = rede?.nome
        
        self.mapView.delegate = self
        
        addMapAnnotation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mapaDetalhe" {
            let detalheViewController = segue.destination  as! DetalheViewController
            if let rede = sender as? Rede {
                detalheViewController.rede = rede
            }
        }
    }

}
