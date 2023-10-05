//
//  CitiesCollectionViewCell.swift
//  borala
//
//  Created by Rober on 21/09/23.
//

import UIKit

class CitiesCollectionViewCell: UICollectionViewCell {
    static let identifier = "CitiesCollectionViewCell"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images = [
        UIImage(named: "ipanema"),
        UIImage(named: "paris"),
        UIImage(named: "sydney"),
        UIImage(named: "southAfrica"),
        UIImage(named: "Chile"),
        UIImage(named: "floripa"),
        UIImage(named: "Disney"),
        UIImage(named: "ouroPreto"),
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       // imageView.image = nil
    }
    
}
