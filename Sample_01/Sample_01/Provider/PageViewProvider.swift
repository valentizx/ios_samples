//
//  PageViewProvider.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import Foundation

class PageViewProvider {
    
    private(set) var datas: [SongData] = []
    
    func createDataSource(with songs: [Song]) {
        datas.removeAll()
        for (index, song) in songs.enumerated() {
            datas.append(SongData(song: song, index: index, image: .init(named: song.thumbnail)!))
        }
    }
}
