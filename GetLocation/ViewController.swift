//
//  ViewController.swift
//  GetLocation
//
//  Created by valentine on 28.03.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var label: UILabel!
    var manager: CLLocationManager?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "ready"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        
        label.text = "\(first.coordinate.longitude) | \(first.coordinate.latitude)"
    }

}

