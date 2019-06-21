//
//  AlbumDetailViewController.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    var album: Album?
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    @IBOutlet var kindLabel: UILabel!
    @IBOutlet var openMusicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateValues()
    }
    
    func updateValues() {
        guard let album = album else { return }
        
        if let imageUrl = URL.init(string: album.imageUrl) {
            imageView.sd_setImage(with: imageUrl, placeholderImage: nil, options: [], completed: nil)
        }
        
        self.title = album.title
        titleLabel.text = album.title
        artistNameLabel.text = album.artistName
        releaseDate.text = album.releaseDate
        copyrightLabel.text = album.copyright
        kindLabel.text = album.kind.capitalized
    }
    
    @IBAction func openMusicAppAction() {
        
        if let urlString = album?.url, let url = URL.init(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}

//let title: String
//let artistName: String
//let imageUrl: String
//let copyright: String
//let url: String
