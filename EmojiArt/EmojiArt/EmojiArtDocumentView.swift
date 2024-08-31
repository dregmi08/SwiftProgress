//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Drishti Regmi on 8/29/24.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document = EmojiArtDocument()
    private let emojis = "🌟🍉🐢🚀🎈🦋🍕🍦🎮🍓🐱🦄🎨🏀🌺🐶🍀🚲🎃📚🏖️🐸🎧🍎🚁🌻🎂🎵🍇📷🐍🍔🌞🍭🏆"
    typealias emoji = EmojiArt.Emoji
    
    private let paletteEmojiSize: CGFloat = 40
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            ScrollingEmojis(emojis)
                .font(.system(size: paletteEmojiSize))
                .padding(.horizontal)
                .scrollIndicators(.hidden)
        }
    }
    
    private var documentBody : some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                AsyncImage(url: document.background)
                    .position(emoji.Position.zero.in(geometry))
                ForEach(document.emojis) { emoji in
                    Text(emoji.string)
                        .font(emoji.font)
                        .position(emoji.position.in(geometry))
                }
            }
            .dropDestination(for: Sturldata.self) { sturldatas, location in
               
                return drop(sturldatas, at: location, in: geometry)
            }
        }
    }
    
    private func drop(_ sturldatas : [Sturldata], at location: CGPoint, in geometry: GeometryProxy) -> Bool {
        for sturldata in sturldatas {
            switch sturldata {
            case .url(let url):
                document.setBackground(url)
                return true
            case .string(let emoji):
                document.addEmoji(position: emojiPosition(location, geometry), size: 40, emoji)
                return true
            default:
                break
            }
        }
        return false
    }
    
    private func emojiPosition (_ location: CGPoint, _ geometry: GeometryProxy) -> emoji.Position {
        let center = geometry.frame(in: .local).center
        return emoji.Position (x: Int(center.x - location.x), y:  -(Int(center.y - location.y)))
    }
}


struct ScrollingEmojis: View {
    let emojis: [String]
    
    init(_ emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                        .draggable(emoji)
                }
            }
        }
    }
}

struct EmojiArtDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
