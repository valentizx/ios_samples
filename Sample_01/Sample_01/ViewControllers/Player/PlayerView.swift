//
//  PlayerView.swift
//  Sample_01
//
//  Created by ZX on 2022/2/17.
//

import SwiftUI

struct PlayerView: View {
    
    var song: Song?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
