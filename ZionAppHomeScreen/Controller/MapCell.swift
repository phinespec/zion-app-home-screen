//
//  MapCell.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 10/5/20.
//

import UIKit

class MapCell: UITableViewCell {
    
    var mapImageView = UIImageView()
    var mapTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mapImageView)
        addSubview(mapTitleLabel)
        
        configureMapImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder: has not been implemented")
    }
    
    func configureMapImageView() {
        mapImageView.layer.cornerRadius = 10
        mapImageView.clipsToBounds = true
        
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        mapImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mapImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        mapImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        mapImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func configureMapTitleLabel() {
        mapTitleLabel.numberOfLines = 0
        mapTitleLabel.adjustsFontSizeToFitWidth = true
    }

}
