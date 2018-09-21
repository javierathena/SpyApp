//
//  TriangleNumberCipher.swift
//  SpyApp
//
//  Created by Athena Javier on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct TriangleNumberCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var shiftBy = UInt32(secret)!
        shiftBy = ((shiftBy * (shiftBy + 1 ))/2 )
        
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            
            if
            
                shiftedUnicode > 126 {
                shiftedUnicode = shiftedUnicode - 94 }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        var decrypted = ""
        var shiftBy = UInt32(secret)!
        shiftBy = ((shiftBy * (shiftBy + 1 ))/2 )
        
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy
            
            if
                
                shiftedUnicode < 33 {
                shiftedUnicode = shiftedUnicode + 94 }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
        
    }
}
    

