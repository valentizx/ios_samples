//
//  PageViewController.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import UIKit
import SwiftUI

struct PageViewControllerWrapper: UIViewControllerRepresentable {
    
    var songs: [Song]
    @Binding var backgroundColor: Color
    @Binding var currentIndex: Int
    
    func makeUIViewController(context: Context) -> PageViewController {
        return PageViewController(delegate: context.coordinator)
    }
    
    func updateUIViewController(_ pageViewController: PageViewController, context: Context) {
        guard !songs.isEmpty else { return }
        pageViewController.reloadDatas(with: songs)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PageViewControllerDelegate {
        
        var parent: PageViewControllerWrapper
        
        init(_ parent: PageViewControllerWrapper) {
            self.parent = parent
        }
        
        //MARK: - PageViewControllerDelegate
        func pageViewController(_ controller: PageViewController, scrollTo currentIndex: Int, andDidFinishingParsing averageColor: UIColor) {
            DispatchQueue.main.async {
                self.parent.backgroundColor = Color(averageColor)
                self.parent.currentIndex = currentIndex
            }
        }
    }
}
