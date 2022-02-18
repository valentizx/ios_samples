//
//  DetailViewControllerWrapper.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import UIKit
import SwiftUI

struct DetailViewControllerWrapper: UIViewControllerRepresentable {
    
    var song: Song
    
    func updateUIViewController(_ uiViewController: DetailViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> DetailViewController {
        return DetailViewController(song: song)
    }
    
}
