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
    
    var maps = [Map]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map Details"
        view.backgroundColor = .white
        maps = fetchData()
        configureTableView()
        configureMapView()
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
