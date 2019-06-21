//
//  AlbumTableViewCell.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumImageView.image = UIImage.init(named: "placeholder")
        nameLabel.text = "     "
        artistNameLabel.text = ""
    }
}
