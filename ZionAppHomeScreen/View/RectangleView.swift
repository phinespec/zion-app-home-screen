//
//  RectangleView.swift
//  ZionAppHomeScreen
//
//  Created by App Dev on 10/1/20.
//

import UIKit

class RectangleView: UIView {
    
    private var identifier = 0
    private static var idSetter = 0
    
    let data = AppData()
    let view = HomeViewController()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.identifier = RectangleView.getUniqueIdentier()
        configureTap()
    }
    
    private static func getUniqueIdentier() -> Int {
        idSetter += 1
        return idSetter
    }
    
    func getLabel(x: Int, y: Int, width: Int, height: Int, text: String, fontSize: Int) -> UILabel {
        let label = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        label.text = text.uppercased()
        label.textColor = .white
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: CGFloat(fontSize))
        label.textAlignment = .left
        return label
    }
    
    func getImage(named name: String) -> UIImageView {
        let image = UIImage(named: name)
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleToFill
        self.clipsToBounds = true
        return iv
    }
    
    private func configureTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(wasTapped(_:)))
        tap.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    @objc func wasTapped(_ sender: UITapGestureRecognizer) {
        let vc = CustomVC()
        view.present(vc, animated: true)
    }
}


