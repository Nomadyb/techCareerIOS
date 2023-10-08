//
//  ViewController.swift
//  lokasyonkullanimi
//
//  Created by Ahmet Emin Yalçınkaya on 5.10.2023.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
	
	@IBOutlet weak var labelEnlem: UILabel!
	
	@IBOutlet weak var labelBoylam: UILabel!
	
	
	@IBOutlet weak var labelHiz: UILabel!
	
	var locationManager = CLLocationManager()
	
	@IBOutlet weak var mapConnect: MKMapView!
	//42.2323,27.23123
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		
		locationManager.requestWhenInUseAuthorization()
		locationManager.startUpdatingLocation()
		locationManager.delegate = self
		
		
		
		
		let konum = CLLocationCoordinate2D(latitude: 41.0370013, longitude: 28.974792)
		let zoom = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
		let bolge = MKCoordinateRegion(center: konum, span: zoom)
		mapConnect.setRegion(bolge, animated: true)
		
		let pin = MKPointAnnotation()
		pin.coordinate = konum
		pin.title = "İstanbul"
		pin.subtitle = "Taksim"
		mapConnect.addAnnotation(pin)
		
		
	}


}


extension ViewController : CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let sonKonum = locations[locations.count-1]
		
		labelEnlem.text = "Enlem : \(sonKonum.coordinate.latitude)"
		
		labelBoylam.text = "Boylam : \(sonKonum.coordinate.longitude)"
		labelHiz.text = "Enlem : \(sonKonum.speed)"
		
		
	}
}

