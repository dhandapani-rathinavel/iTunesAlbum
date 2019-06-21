//
//  ViewController.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var viewModel: AlbumListViewModel?
    let SHOW_DETAIL = "showDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 74
        tableView.rowHeight = UITableView.automaticDimension
        
        viewModel = AlbumListViewModel.init(tableView, delegate: self)
        viewModel?.getAlbums()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOW_DETAIL, let albumDetailVC = segue.destination as? AlbumDetailViewController, let album = sender as? Album {
            albumDetailVC.album = album
        }
    }
}

extension AlbumListViewController: AlbumListViewModelDelegate {
    func didSelect(album: Album) {
        self.performSegue(withIdentifier: SHOW_DETAIL, sender: album)
    }
}
