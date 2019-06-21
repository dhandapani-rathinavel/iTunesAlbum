//
//  WebServiceEndPointBuilder.swift
//  iTunesAlbum
//
//  Created by DHANDAPANI R on 21/06/19.
//  Copyright © 2019 Dhandapani R. All rights reserved.
//

import Foundation

class WebServiceEndPointBuilder {
    public class func itunesAlbumListUrl() -> URL? {
        let scheme = "https"
        let host = "rss.itunes.apple.com"
        let path = "/api/v1/in/apple-music/coming-soon/all/50/explicit.json"
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        return urlComponents.url
    }
}
