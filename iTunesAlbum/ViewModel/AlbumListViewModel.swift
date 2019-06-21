//
//  AlbumListViewModel.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

protocol AlbumListViewModelDelegate {
    func didSelect(album: Album)
}

class AlbumListViewModel {
    weak var tableView: UITableView?
    var delegate: AlbumListViewModelDelegate?
    var albumListDelegate: AlbumListDelegate?
    
    var albumListDataSource: AlbumListDataSource? {
        didSet {
            updateData()
        }
    }
    
    init(_ tableView: UITableView, delegate: AlbumListViewModelDelegate) {
        self.tableView = tableView
        self.delegate = delegate
    }
    
    fileprivate func updateData() {
        DispatchQueue.main.async{
            self.tableView?.dataSource = self.albumListDataSource
            self.albumListDelegate = AlbumListDelegate.init(albumDataSource: self.albumListDataSource, albumViewModel: self)
            self.tableView?.delegate = self.albumListDelegate
            self.tableView?.reloadData()
        }
    }
    
    func getAlbums() {
        guard let albumListUrl = WebServiceEndPointBuilder.itunesAlbumListUrl() else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: albumListUrl)) { (data, response, error) in
            if let data = data {
                do {
                    let feedInfo = try JSONDecoder().decode(FeedInfo.self, from: data)
                    self.albumListDataSource = AlbumListDataSource.init(albums: feedInfo.feed.albums)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}

class AlbumListDataSource: NSObject, UITableViewDataSource {
    let albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
    }
    
    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = albums[indexPath.row]
        
        let albumCell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") as! AlbumTableViewCell
        albumCell.nameLabel.text = album.title
        albumCell.artistNameLabel.text = album.artistName
        if let imageUrl = URL.init(string: album.imageUrl) {
            albumCell.albumImageView!.sd_setImage(with: imageUrl, placeholderImage: nil, options: [], completed: nil)
        }
        return albumCell
    }
}

class AlbumListDelegate: NSObject, UITableViewDelegate {
    weak var albumDataSource: AlbumListDataSource?
    weak var albumViewModel: AlbumListViewModel?
    
    init(albumDataSource: AlbumListDataSource?, albumViewModel: AlbumListViewModel?) {
        self.albumDataSource = albumDataSource
        self.albumViewModel = albumViewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let album = albumDataSource?.albums[indexPath.row] {
            albumViewModel?.delegate?.didSelect(album: album)
        }
    }
}
