import UIKit
import Accelerate

extension CGImage {
    func resized(width: Int, height: Int) -> CGImage? {
        var error = kvImageNoError
        var format = vImage_CGImageFormat(
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            colorSpace: nil,
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.first.rawValue),
            version: 0,
            decode: nil,
            renderingIntent: CGColorRenderingIntent.defaultIntent
        )
        var sourceBuffer = vImage_Buffer()
        defer {
            sourceBuffer.data.deallocate()
        }
        
        error = vImageBuffer_InitWithCGImage(
            &sourceBuffer,
            &format,
            nil,
            self,
            numericCast(kvImageNoFlags)
        )
        guard error == kvImageNoError else { return nil }
        
        // create a destination buffer
        let scale = 1
        let destWidth = width
        let destHeight = height
        let bytesPerPixel = bitsPerPixel / 8
        let destBytesPerRow = destWidth * bytesPerPixel
        let destData = UnsafeMutablePointer<UInt8>.allocate(capacity: destHeight * destBytesPerRow)
        defer {
            destData.deallocate()
        }
        var destBuffer = vImage_Buffer(
            data: destData,
            height: vImagePixelCount(destHeight),
            width: vImagePixelCount(destWidth),
            rowBytes: destBytesPerRow
        )
        
        // scale the image
        error = vImageScale_ARGB8888(
            &sourceBuffer,
            &destBuffer,
            nil,
            numericCast(kvImageHighQualityResampling)
        )
        guard error == kvImageNoError else { return nil }
        
        // create a CGImage from vImage_Buffer
        let destCGImage = vImageCreateCGImageFromBuffer(
            &destBuffer,
            &format,
            nil,
            nil,
            numericCast(kvImageNoFlags),
            &error
        )?.takeRetainedValue()
        guard error == kvImageNoError else { return nil }
        
        return destCGImage
    }
}
