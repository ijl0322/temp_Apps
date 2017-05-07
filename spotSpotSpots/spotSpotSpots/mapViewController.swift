//
//  mapViewController.swift
//  spotSpotSpots
//
//  Created by Isabel  Lee on 06/05/2017.
//  Copyright © 2017 isabeljlee. All rights reserved.
//  http://stackoverflow.com/questions/15292318/mkmapview-mkpointannotation-tap-event
//  http://stackoverflow.com/questions/5648169/howto-detect-tap-on-map-annotaition-pin
//  

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    let manager = CLLocationManager()
    var currentLoacation:CLLocationCoordinate2D? = nil
    
    @IBOutlet weak var map: MKMapView!
    @IBAction func addLocation(_ sender: UIButton) {
        if let favoriteLocation = currentLoacation {
            let annotation = MapAnnotation(title: "My Favorite Location",
                                           subtitle: "", coordinate: favoriteLocation)
            
            map.addAnnotation(annotation)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        map.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        currentLoacation = myLocation
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapAnnotation {
            let identifier = "CustomPin"

            var view: MKPinAnnotationView

            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                let likeButton = UIButton(type: .detailDisclosure)
                likeButton.tag = 1
                let hateButton = UIButton(type: .detailDisclosure)
                hateButton.tag = 2
                view.rightCalloutAccessoryView = likeButton
                view.leftCalloutAccessoryView = hateButton
            }
            configureDetailView(annotationView: view, image: annotation.image)
            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Pin tapped")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        //print(view.annotation!.title ?? "no title" )
        print(control.tag)
    }
    
    func configureDetailView(annotationView: MKAnnotationView, image: UIImage?) {
        let width = 100.0
        let height = 100.0
        
        let snapshotView = UIView()
        let views = ["snapshotView": snapshotView]
        snapshotView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[snapshotView(150)]", options: [], metrics: nil, views: views))
        snapshotView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[snapshotView(150)]", options: [], metrics: nil, views: views))
        
        let options = MKMapSnapshotOptions()
        options.size = CGSize(width: width, height: height)
        options.mapType = .satelliteFlyover
        
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            if snapshot != nil {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
                imageView.image = image
                imageView.contentMode = .scaleAspectFill
                imageView.layer.borderWidth = 3
                imageView.layer.borderColor = UIColor.black.cgColor
                snapshotView.addSubview(imageView)
            }
        }
        
        annotationView.detailCalloutAccessoryView = snapshotView
    }
}
