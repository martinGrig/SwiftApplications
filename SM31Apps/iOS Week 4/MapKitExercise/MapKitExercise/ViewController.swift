//
//  ViewController.swift
//  MapKitExercise
//
//  Created by Student on 26/09/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle: String, pinSubTitle:String, location: CLLocationCoordinate2D ) {
        coordinate = location
        title = pinTitle
        subtitle = pinSubTitle
    }
    
}

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var maView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = CLLocationCoordinate2D(latitude: 37.970833, longitude: 23.726110)
        
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        self.maView.setRegion(region, animated: true)
        
        let pin = customPin(pinTitle: "Parthenon", pinSubTitle: "Athens, Elada" , location: location)
        self.maView.addAnnotation(pin)
        self.maView.delegate = self
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation , reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pinm " )
        
        annotationView.canShowCallout = true
        return annotationView
    }

}

