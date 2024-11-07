import Foundation
import CoreText

extension AttributedString.AdaptiveImageGlyph {
    public init(imageContent: AdaptiveImageContent) {
        self.init(imageContent: imageContent.makeData())
    }
}
