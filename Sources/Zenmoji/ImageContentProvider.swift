import UIKit
import UniformTypeIdentifiers

public struct ImageContentProvider {
    let id: String
    let strikes: [EmojiImageStrike]
    
    public init(
        id: String = UUID().uuidString,
        image: UIImage,
        lengths: [Int] = [160, 40, 64, 96, 320]
    ) {
        self.id = id
        self.strikes = lengths.map({ length in
            EmojiImageStrike(cgImage: image.cgImage!, length: length)
        })
    }
    
    func imageContent() -> Data {
        let imageContent = NSMutableData()
        let destination = CGImageDestinationCreateWithData(
            imageContent,
            NSAdaptiveImageGlyph.contentType.identifier as CFString,
            strikes.count,
            nil
        )!
        for strike in strikes {
            let metadata = strike.makeMetadata()
            metadata.set(id, forKey: "tiff:DocumentName")
            CGImageDestinationAddImageAndMetadata(
                destination,
                strike.resizedImage(),
                metadata,
                nil
            )
        }
        CGImageDestinationFinalize(destination)
        return imageContent as Data
    }
}

