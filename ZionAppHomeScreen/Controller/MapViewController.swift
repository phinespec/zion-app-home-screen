//
//  MapView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 9/28/20.
//

import UIKit

class MapViewController: UIViewController {
    
    var mapView = RectangleView()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map Details"
        view.backgroundColor = .white
        configureTableView()
        configureMapView()
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.register(MapCell.self, forCellReuseIdentifier: "MapCell")
        
        // Add constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        mapView.backgroundColor = .white
        
        // Set constraints
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: (view.frame.height / 2) - 10).isActive = true
        
        let mapImage = mapView.getImage(named: "ZionMap")
        mapView.addSubview(mapImage)
        
        
    }


}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
        
        return UITableViewCell()
    }
}
