//
//  CollectionViewCell.swift
//  Coco
//
//  Created by Muhammad Faruuq Qayyum on 15/06/20.
//  Copyright © 2020 Apple Academy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var data: Content? {
        didSet {
            guard let data = data else { return }
            imageContainer.image = data.image
            label.text = data.title
        }
        
    }
    
    let viewContainer: UIView = {
        let viewContainer = UIView()
        viewContainer.layer.cornerRadius = 30
        viewContainer.backgroundColor = #colorLiteral(red: 0.6666666667, green: 0.2901960784, blue: 0.168627451, alpha: 1)
        viewContainer.contentMode = .scaleAspectFill
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        return viewContainer
    }()
    
    let imageContainer: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "Home image"))
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Foreign Island"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(imageContainer)
        viewContainer.addSubview(label)
        
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            imageContainer.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 25),
            imageContainer.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -60),
            imageContainer.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }
    
}
