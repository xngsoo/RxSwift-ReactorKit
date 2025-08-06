//
//  Result.swift
//  Rx+Reactor
//
//  Created by 한승수 on 8/6/25.
//

import Foundation

struct ImageSearchResult: Decodable {
    let documents: [ImageDocument]
    let meta: Meta
}

struct ImageDocument: Decodable {
    let collection: String
    let thumbnail_url: String
    let image_url: String?
    let width: Int
    let height: Int
    let display_sitename: String
    let doc_url: String
    let datetime: String
    
//    enum CodingKeys: String, CodingKey {
//        case collection
//        case thumbnailURL = "thumbnail_url"
//        case imageURL = "image_url"
//        case width, height
//        case displaySitename = "display_sitename"
//        case docURL
//    }
}

struct Meta: Decodable {
    let total_count: Int
    let pageable_count: Int
    let is_end: Bool
}
