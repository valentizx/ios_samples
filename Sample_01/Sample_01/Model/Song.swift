//
//  Song.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import Foundation
import SwiftyJSON

struct Song {
    var title: String //标题
    var artist: String //演唱家
    var thumbnail: String //封面
    var year: String //发行年代
    var album: String //所属专辑
    var genre: String //流派
    
    init(_ json: JSON) {
        self.title = json["title"].stringValue
        self.artist = json["artist"].stringValue
        self.thumbnail = json["thumbnail"].stringValue
        self.year = json["year"].stringValue
        self.album = json["album"].stringValue
        self.genre = json["genre"].stringValue
    }
}
