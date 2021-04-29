//
//  TopRatedCollectionViewCell.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 28/04/21.
//

import UIKit

class TopRatedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbTitleMovie: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(value: Result?){
        if let _value = value {
        self.lbTitleMovie.text = _value.title
        }
    }

}
