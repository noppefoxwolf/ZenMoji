# Zenmoji

Zenmoji is a NSAdaptiveImageGlyph based custom emoji rendering.

# Usage

```swift
import Zenmoji

let image = UIImage(resource: .blobcat)
let adaptiveImageContent = AdaptiveImageContent(image: image)
let adaptiveImageGlyph = NSAdaptiveImageGlyph(imageContent: adaptiveImageContent)
let attributedText = NSAttributedString(adaptiveImageGlyph: adaptiveImageGlyph)
textView.insertAttributedText(attributedText)
```

# License

Zenmoji is available under the MIT license. See the LICENSE file for more info.

