//
//  PlayerScreen.swift
//  SwiftUIPractice
//
//  Created by Алексей Смицкий on 17.04.2022.
//

import AVFoundation
import SwiftUI

class PlayerViewModel: ObservableObject {
    
    @Published public var maxDuration = 0.0
    
    public var songName: String?
    
    private var player: AVAudioPlayer?
    
    public func play() {
        guard let songName = songName else { return }
        playSong(name: songName)
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playSong(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0
        } catch {
            print("Failed to play song")
        }
    }
}

struct PlayerScreen: View {
    
    @State private var progress: Float = 0
    @ObservedObject private var player = PlayerViewModel()
    
    var body: some View {
        VStack {
            Slider(value: Binding(
                get: {
                    self.progress
                },
                set: { newValue in
                    self.progress = newValue
                    player.setTime(value: self.progress)
                }),
                   in: 0...100)
            HStack {
                Button {
                    self.player.songName = "TheXX-Intro"
                    self.player.play()
                } label: {
                    Text("Play")
                        .foregroundColor(.black)
                }
                .frame(width: 100, height: 50)
                .background(.orange)
                .cornerRadius(15)
                
                Button {
                    self.player.stop()
                } label: {
                    Text("Stop")
                        .foregroundColor(.black)
                }
                .frame(width: 100, height: 50)
                .background(.orange)
                .cornerRadius(15)
            }
        }
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScreen()
    }
}
