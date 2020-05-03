//
//  VideoControlsOverlay.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoControlsOverlay: View {
    @ObservedObject var viewModel: VideoViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 50) {
                if self.viewModel.isLoading {
                    ActivityIndicator(isAnimating: self.$viewModel.isLoading)
                }
                else if self.viewModel.didFinishPlaying {
                    VideoControlButton(type: .replay, action: self.replay)
                }
                else if self.viewModel.isPlaying {
                    VideoControlButton(type: .pause, action: self.pause)
                }
                else {
                    VideoControlButton(type: .play, action: self.play)
                }
            }
            .foregroundColor(.white)
            .opacity(0.9)
        }
    }
    
    private func play() {
        self.viewModel.isPlaying = true
        self.viewModel.isShowingControls = false
    }
    
    private func pause() {
        self.viewModel.isPlaying = false
    }
    
    private func replay() {
        self.viewModel.shouldReplay = true
    }
}

struct VideoControls_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
