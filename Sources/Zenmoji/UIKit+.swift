import UIKit

extension NSAdaptiveImageGlyph {
    public convenience init(imageContent: AdaptiveImageContent) {
        self.init(imageContent: imageContent.makeData())
    }
}
