//
//  Links.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 07/11/2021.
//

import Foundation

struct Links: Decodable {
    
    let patch: Patch?
    let youtubeId: String?
    let article: String?
    let wikipedia: String?
    
    init(patch: Patch?,
         youtubeId: String?,
         article: String?,
         wikipedia: String?) {
        self.patch = patch
        self.youtubeId = youtubeId
        self.article = article
        self.wikipedia = wikipedia
    }
    
    enum CodingKeys: String, CodingKey {
        case youtubeId = "youtube_id"
        case patch
        case article
        case wikipedia
    }
}
