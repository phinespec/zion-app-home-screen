//
//  HomeMainView.swift
//  ZionAppHomeScreen
//
//  Created by Philip Trunnell on 9/30/20.
//

import UIKit

@IBDesignable
class HomeMainView: UIView {
    
    @IBInspectable
    var headerView = UIView()
    var leftStackView = UIStackView()
    var rightStackView = UIStackView()
    var headerLabelView = UILabel()
    
    
    func configureLeftStackView() {
        self.addSubview(leftStackView)
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillEqually
        leftStackView.spacing = 10
        
        //leftStackViewiew constraints
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10 ).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        leftStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10).isActive = true
        
    }
    
    func configureHeaderView() {
        self.addSubview(headerView)
        headerView.frame = CGRect(x: 0, y: 0, width: 414, height: 150)
        headerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
    }
    
    func configureHeaderLabelView() {
        self.addSubview(headerLabelView)
        headerLabelView.frame = CGRect(x: 0, y: 75, width: 200, height: 80)
        headerLabelView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        translatesAutoresizingMaskIntoConstraints = false
        headerLabelView.adjustsFontSizeToFitWidth = true
        headerLabelView.text = "Greater Zion Region"
        headerLabelView.font = UIFont.preferredFont(forTextStyle: .headline)
        headerLabelView.textAlignment = .left
        
        headerLabelView.leftAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
    }

}
