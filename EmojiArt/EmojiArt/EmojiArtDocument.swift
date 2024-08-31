//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Drishti Regmi on 8/29/24.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    
    typealias Emoji = EmojiArt.Emoji
    
    @Published private var emojiArt = EmojiArt()
    
    init() {
        
    }
    
    var emojis : [Emoji] {
        emojiArt.emojis
    }
    
    var background: URL? {
        emojiArt.background
    }
    
    //MARK: - Intents

    func setBackground(_ url: URL?) {
        emojiArt.background = url
    }
    
     func addEmoji(position: Emoji.Position, size: CGFloat, _ emoji : String){
        emojiArt.addEmoji(position: position, size: Int(size), emoji)
    }

}
