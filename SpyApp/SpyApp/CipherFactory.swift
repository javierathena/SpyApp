import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumericCesar": AlphanumericCesarCipher(),
        "TriangleNumberCipher": TriangleNumberCipher(),
        "HexNumberCipher": HexNumberCipher(),
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
