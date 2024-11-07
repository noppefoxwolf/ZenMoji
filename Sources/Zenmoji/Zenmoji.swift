import UIKit
import UniformTypeIdentifiers

extension NSAdaptiveImageGlyph {
    public convenience init(imageContent: AdaptiveImageContent) {
        self.init(imageContent: imageContent.makeData())
    }
}

struct ImageContent {
    let image: CGImage
    let length: Int
    
    func makeMetadata() -> CGMutableImageMetadata {
        let metadata = CGImageMetadataCreateMutable()
        metadata.set(length, forKey: "tiff:TileLength")
        metadata.set(length, forKey: "tiff:TileWidth")
        metadata.set(true, forKey: "iio:hasXMP")
        metadata.set("https://github.com/noppefoxwolf/ZenMoji", forKey: "xmp:CreatorTool")
        return metadata
    }
}

public struct AdaptiveImageContent {
    let id: String
    let imageContents: [ImageContent]
    
    public init(
        id: String = UUID().uuidString,
        image: UIImage
    ) {
        self.id = id
        self.imageContents = [160, 40, 64, 96, 320].map({ length in
            let image = image.cgImage!.resized(width: length, height: length)!
            return ImageContent(image: image, length: length)
        })
    }
    
    func makeData() -> Data {
        let imageContent = NSMutableData()
        let destination = CGImageDestinationCreateWithData(
            imageContent,
            UTType.heic.identifier as CFString,
            imageContents.count,
            nil
        )!
        for imageContent in imageContents {
            let metadata = imageContent.makeMetadata()
            metadata.set(id, forKey: "tiff:DocumentName")
            CGImageDestinationAddImageAndMetadata(
                destination,
                imageContent.image,
                metadata,
                nil
            )
        }
        CGImageDestinationFinalize(destination)
        return imageContent as Data
    }
}

