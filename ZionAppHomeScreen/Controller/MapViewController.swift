//
//  MapView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    let zionLatitude = 37.317207
    let zionLongitude = -113.022537
    let regionInMeters: Double = 10_000
    
    
    var mapView: MKMapView = {
        let mapView = MKMapView()
        //mapView.setRegion()
        return mapView
    }()
    let locationManager = CLLocationManager()
    let tableView = UITableView()
    var maps = [Map]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map Details"
        view.backgroundColor = .white
        maps = fetchData()
        configureTableView()
        configureMapView()
        checkLocationServices()
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(MapCell.self, forCellReuseIdentifier: "MapCell")
        
        // Set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        mapView.backgroundColor = .white
        mapView.delegate = self
        
        // Set constraints
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: (view.frame.height / 2) - 10).isActive = true
        
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            locationManager.startUpdatingLocation()
        } else {
            // Show alert letting the user know why they need to turn this on
        }
    }
    
    func checkLocationAuthorization() {
        mapView.showsUserLocation = true
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            centerViewOnUserLocation()
            break
        case .denied:
            // Show alert instructing how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            // Show an alert letting them know what's going on
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }


}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maps.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
        let map = maps[indexPath.row]
        cell.set(map: map)
        return cell
    }
    
    func fetchData() -> [Map]{
        let map1 = Map(id: 0, title: "This is a test")
        let map2 = Map(id: 1, title: "This is another test")
        
        return [map1, map2]
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // To be written
    }
}
