import ImageIO
import Foundation

extension CGMutableImageMetadata {
    func set(_ value: String, forKey key: String) {
        CGImageMetadataSetValueWithPath(
            self,
            nil,
            key as CFString,
            value as CFString
        )
    }
    
    func set(_ value: Int, forKey key: String) {
        CGImageMetadataSetValueWithPath(
            self,
            nil,
            key as CFString,
            value as CFNumber
        )
    }
    
    func set(_ value: Bool, forKey key: String) {
        CGImageMetadataSetValueWithPath(
            self,
            nil,
            key as CFString,
            value as CFBoolean
        )
    }
}
