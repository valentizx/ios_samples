//
//  ContentView.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import SwiftUI
import SwiftyJSON

struct ContentView: View {
    
    @State var songs: [Song] = []
    @State var backgroundColor: Color = .red
    @State var currentIndex: Int = 0
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            makeBackgroundColor(with: backgroundColor)
            VStack {
                if !songs.isEmpty {
                    let song = songs[currentIndex]
                    Text("\(song.artist)•\(song.title)•\(song.album)")
                        .bold()
                        .frame(width: UIScreen.main.bounds.width, height: 20)
                        .font(.title3)
                        .foregroundColor(.white)
                }
                PageViewControllerWrapper(
                    songs: songs,
                    backgroundColor: $backgroundColor,
                    currentIndex: $currentIndex
                )
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                Button("Show Detail") {
                    isPresented.toggle()
                }.fullScreenCover(isPresented: $isPresented) {
                    print("Detail view controller dismiss")
                } content: {
                    let song = songs[currentIndex]
                    DetailViewControllerWrapper(song: song).edgesIgnoringSafeArea(.all)
                }
            }
        }
        .onAppear {
            parseJSON()
        }
    }
    
    func makeBackgroundColor(with color: Color) -> some View {
        return color.edgesIgnoringSafeArea(.all).animation(.easeInOut, value: 1)
    }
    
    func parseJSON() {
        if let url = Bundle.main.url(forResource: "songs", withExtension: "json") {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            guard let jsonData = try? JSON(data: data) else {
                return
            }
            let datas = jsonData["datas"].arrayValue
            songs = datas.map({ Song($0) })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
