//
//  RectangleView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 10/1/20.
//

import UIKit

class RectangleView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
    }
    
    func configureView(){
        translatesAutoresizingMaskIntoConstraints = false
        
        // Create, add and layout child views here
    }
    
    
}
