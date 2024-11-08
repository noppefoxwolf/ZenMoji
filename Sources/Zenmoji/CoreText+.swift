import Foundation
import CoreText

@available(iOS 18.0, *)
extension AttributedString.AdaptiveImageGlyph {
    public init(provider: ImageContentProvider) {
        self.init(imageContent: provider.imageContent())
    }
}
