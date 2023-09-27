//
//  HomeCollectionViewCell.swift
//  borala
//
//  Created by Julio Braganca on 21/09/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    static let identifier: String = "HomeCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        placeImageView.contentMode = .scaleAspectFill
    }
    
    func setupCell(places: Places) {
        placeImageView.image = UIImage(named: places.imageName)
        placeLabel.text = places.placeName
        placeLabel.textColor = Color.tangerine
        placeLabel.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
