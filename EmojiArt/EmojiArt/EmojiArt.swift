//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Drishti Regmi on 8/29/24.
//

import Foundation

struct EmojiArt: Codable{
    
    var background: URL?
    private(set) var emojis = [Emoji]()
    
    static private var uniqueEmojiIdentification: Int = 0
    
    mutating func addEmoji(position: Emoji.Position, size: Int, _ emoji : String) {
        emojis.append(Emoji(id: EmojiArt.uniqueEmojiIdentification,
                            string: emoji, position: position, size: size))
        EmojiArt.uniqueEmojiIdentification += 1
        
    }
    
     func json () throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    init(json: Data) throws {
        self = try JSONDecoder().decode(EmojiArt.self, from: json)
    }
    
    init() {
        
    }
    
    struct Emoji: Identifiable, Codable {
        let id : Int
        let string: String
        var position: Position
        var size: Int
        
        struct Position: Codable {
            var x: Int
            var y: Int
            
            static let zero = Self(x: 0, y: 0)
        }
    }
    
}
