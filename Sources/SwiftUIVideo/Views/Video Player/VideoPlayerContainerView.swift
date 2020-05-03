//
//  VideoPlayerContainerView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import SwiftUI

struct VideoPlayerContainerView: View {
    let player: AVPlayer
    
    @Binding var isExpanded: Bool
    @Binding var seekPosition: Double
    
    @State var isShowingControls: Bool = true
    
    var body: some View {
        ZStack {
            if self.isExpanded {
                Color.black
                    .edgesIgnoringSafeArea(.all)
            }
            else {
                Color.black
            }
            
            VideoPlayerView(player: self.player)
                .aspectRatio(1242.0 / 529.0, contentMode: .fit)
            VideoPlayerControlsView(player: self.player, isExpanded: self.$isExpanded, isShowingControls: self.$isShowingControls, seekPosition: self.$seekPosition)
                .opacity(self.isShowingControls ? 1 : 0)
                .animation(.easeInOut)
        }
        .onTapGesture(perform: self.toggleControls)
    }
    
    private func toggleControls() {
        self.isShowingControls.toggle()
    }
}

struct VideoPlayerContainerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerContainerView(player: AVPlayer(url: Video.sintel.url!), isExpanded: .constant(false), seekPosition: .constant(0))
    }
}
