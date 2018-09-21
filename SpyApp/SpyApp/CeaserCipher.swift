import Foundation

protocol Cipher  {
    func encode(_ plaintext: String, secret: String) -> String?
    
    func decrypt(_ plaintext: String, secret: String) -> String?
    
    
        
    }



    


struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        var shiftBy = UInt32(secret)!

        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ plaintext: String, secret: String) -> String? {
        var dycrpted = ""
        var shiftBy = UInt32(secret)!
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            dycrpted = dycrpted + shiftedCharacter
        }
        return dycrpted
}
}

