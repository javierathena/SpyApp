//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Athena Javier on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var shiftBy = UInt32(secret)!
        
        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            while shiftedUnicode > 90{
                shiftedUnicode = shiftedUnicode - 43
            }
            while shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode + 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        var decrypt = ""
        var shiftBy = UInt32(secret)!
        
        let uppercasePlaintext = plaintext.uppercased()
        
        for character in uppercasePlaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            while shiftedUnicode < 48{
                shiftedUnicode = shiftedUnicode + 43
            }
            while shiftedUnicode > 57 && shiftedUnicode < 65{
                shiftedUnicode = shiftedUnicode - 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypt = decrypt + shiftedCharacter
        }
        return decrypt
}
}
