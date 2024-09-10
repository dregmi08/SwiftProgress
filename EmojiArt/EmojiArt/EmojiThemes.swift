//
//  EmojiThemes.swift
//  EmojiArt
//
//  Created by Drishti Regmi on 9/8/24.
//

import Foundation

struct EmojiThemes: Identifiable, Codable {
    var themeName: String
    var emojis : String
    var id = UUID()
    
    static var inbuilt: [EmojiThemes] = [
        EmojiThemes(themeName: "animals", emojis: "🐵🐶🐺🐱🦁🐯🦊🐻🐼🐨🐷🐮🐸🐵🙈🙉🙊🐔🐧🐦🐤🦆🦅🦉🦇🐴🦄🐝🐛🦋🐌🐞🦗🦂🕷🐢🦎🐍🐙🦑🦀🦞🦐🐠🐟🐡🐬🐳🐋🦈🐊🐅🐆🦓🦍🦧🦣🦛🦏🦒🐘🦘🦨🦡🐇🦢🦜🦩🐓🦃🦚🦩🐕🐩🐈🐈‍⬛🐇🦝🐿🦔"),
        EmojiThemes(themeName: "travel", emojis: "🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐🛻🚚🚜🛵🏍✈️🚁🚤🛥⛵️🚢🚂🚆🚊🚝"),
        EmojiThemes(themeName: "sports", emojis: "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🏒🏑🏏🏹"),
        EmojiThemes(themeName: "faces", emojis: "😀😃😄😁😆😅😂🤣😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😜🤪😝🤑🤗🤭🤫🤔🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧😵🤯🤠😎🤓🧐😕😟🙁☹️😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀☠️💩🤡👹👺")
    ]
}
