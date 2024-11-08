import Foundation
import CoreText

extension AttributedString.AdaptiveImageGlyph {
    public init(provider: ImageContentProvider) {
        self.init(imageContent: provider.imageContent())
    }
}
