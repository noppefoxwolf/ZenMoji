import UIKit

@available(iOS 18.0, *)
extension NSAdaptiveImageGlyph {
    public convenience init(provider: ImageContentProvider) {
        self.init(imageContent: provider.imageContent())
    }
}
