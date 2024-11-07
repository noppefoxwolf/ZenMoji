# Zenmoji

Zenmoji is a NSAdaptiveImageGlyph based custom emoji rendering.

<img src="https://github.com/noppefoxwolf/ZenMoji/blob/main/.github/screenshot.png" width="320">

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

