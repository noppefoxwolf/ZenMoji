import UIKit

extension NSAdaptiveImageGlyph {
    public convenience init(provider: ImageContentProvider) {
        self.init(imageContent: provider.imageContent())
    }
}
