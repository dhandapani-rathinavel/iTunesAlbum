//
//  Models.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let title: String
    let artistName: String
    let imageUrl: String
    let copyright: String
    let url: String
    let releaseDate: String
    let kind: String

    init(title: String, artistName: String, imageUrl: String, copyright: String, url: String, releaseDate: String, kind: String) {
        self.title = title
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.copyright = copyright
        self.url = url
        self.releaseDate = releaseDate
        self.kind = kind
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "name", artistName, imageUrl = "artworkUrl100", copyright, url, releaseDate, kind
    }
}

struct Feed: Decodable {
    var albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
    }
    
    enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}

struct FeedInfo: Decodable {
    let feed: Feed
    
    init(feed: Feed) {
        self.feed = feed
    }
    
    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

