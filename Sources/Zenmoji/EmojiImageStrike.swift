import ImageIO
import UIKit

struct EmojiImageStrike {
    let cgImage: CGImage
    let length: Int
    
    func resizedImage() -> CGImage {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 1
        let size = CGSize(width: length, height: length)
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let scaledImage = renderer.image { context in
            let uiImage = UIImage(cgImage: cgImage)
            uiImage.draw(in: CGRect(origin: .zero, size: size))
        }
        return scaledImage.cgImage!
    }
    
    func makeMetadata() -> CGMutableImageMetadata {
        let metadata = CGImageMetadataCreateMutable()
        metadata.set(length, forKey: "tiff:TileLength")
        metadata.set(length, forKey: "tiff:TileWidth")
        metadata.set(true, forKey: "iio:hasXMP")
        metadata.set("https://github.com/noppefoxwolf/ZenMoji", forKey: "xmp:CreatorTool")
        return metadata
    }
}
