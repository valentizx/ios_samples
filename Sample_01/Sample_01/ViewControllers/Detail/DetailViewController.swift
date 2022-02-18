//
//  DetailViewController.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import UIKit
import SwiftUI

class DetailViewController: UIViewController {
    
    var song: Song
    
    init(song: Song) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbnail: UIImage = .init(named: song.thumbnail)!
        let bgImageView = UIImageView(image: thumbnail)
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.frame = view.bounds
        view.addSubview(bgImageView)
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effectView.frame = bgImageView.bounds
        view.addSubview(effectView)
        
        let thumbnailImageView = UIImageView(image: thumbnail)
        thumbnailImageView.frame = .init(x: 20, y: 40, width: 150, height: 150)
        view.addSubview(thumbnailImageView)
        
        let detail = UILabel(frame: .init(x: thumbnailImageView.frame.minX, y: thumbnailImageView.frame.maxY + 20, width: UIScreen.main.bounds.width, height: 110))
        detail.font = .boldSystemFont(ofSize: 17)
        detail.numberOfLines = 0
        detail.text = """
                      歌曲名称: \(song.title)
                      演唱者: \(song.artist)
                      所属专辑: \(song.album)
                      发行年份: \(song.year)
                      流派: \(song.genre)
                      """
        detail.textColor = .white
        view.addSubview(detail)
        
        
        let config = UIImage.SymbolConfiguration(weight: .bold)
        let closeImage = UIImage(systemName: "xmark", withConfiguration: config)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIButton(type: .system)
        closeButton.setImage(closeImage, for: .normal)
        closeButton.frame = .init(x: UIScreen.main.bounds.width - 20 - 30, y: thumbnailImageView.frame.minY, width: 30, height: 30)
        closeButton.addTarget(self, action: #selector(closeButtonDidClick(_:)), for: .touchUpInside)
        view.addSubview(closeButton)
        
        let playImage = UIImage(systemName: "play", withConfiguration: config)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let playButton = UIButton(type: .system)
        playButton.setImage(playImage, for: .normal)
        playButton.frame = .init(x: (UIScreen.main.bounds.width - 70)/2, y: detail.frame.maxY + 30, width: 70, height: 30)
        playButton.addTarget(self, action: #selector(playButtonDidClick(_:)), for: .touchUpInside)
        view.addSubview(playButton)
    }
    
    @objc
    func playButtonDidClick(_ sender: UIButton) {
        let controller = UIHostingController(rootView: PlayerView(song: song))
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    @objc
    func closeButtonDidClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
