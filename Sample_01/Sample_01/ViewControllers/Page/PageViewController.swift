//
//  PageViewController.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import UIKit
import SwiftUI

protocol PageViewControllerDelegate {
    func pageViewController(_ controller: PageViewController, scrollTo currentIndex: Int, andDidFinishingParsing averageColor: UIColor)
}

class PageViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var delegate: PageViewControllerDelegate
    var provider: PageViewProvider = PageViewProvider()
    
    init(delegate: PageViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSubviews()
    }
    
    //MARK: - Public
    func reloadDatas(with songs: [Song]) {
        provider.createDataSource(with: songs)
        collectionView.reloadData()
        scrollViewDidScroll(collectionView)
    }
}

//MARK: - Private
extension PageViewController {
    
    private func initializeSubviews() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView = .init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SongCell.self, forCellWithReuseIdentifier: "SongCell")
        collectionView.isPagingEnabled = true
        view.addSubview(collectionView)
    }
}

//MARK: - UICollectionview delegate & data source
extension PageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return provider.datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SongCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.fill(with: provider.datas[indexPath.item])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.frame.width
        var currentIndex = Int(offsetX / width)
        print("当前 currentIndex ->\(currentIndex)")
        if currentIndex >= provider.datas.count {
            currentIndex -= provider.datas.count
        }
        let image = provider.datas[currentIndex].image
        guard let color = image.averageColor else {
            return
        }
        delegate.pageViewController(self, scrollTo: currentIndex, andDidFinishingParsing: color)
    }
}
