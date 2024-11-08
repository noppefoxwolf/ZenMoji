import UIKit
import Zenmoji

final class ViewController: UIViewController {
    let label = UILabel()
    let stepper = UIStepper()
    let textView = UITextView()
    let button = UIButton(configuration: .filled())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        stepper.minimumValue = 12
        stepper.maximumValue = 100
        stepper.value = 16
        label.text = "Zenmoji Example"
        label.font = .systemFont(ofSize: stepper.value)
        
        var title = AttributedString()
        title += AttributedString("Insert ")
        title.append(makeAttributedText())
        button.configuration?.attributedTitle = title
        textView.supportsAdaptiveImageGlyph = true
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.separator.cgColor
        textView.layer.cornerRadius = 8
        
        
        let headerStackView = UIStackView(
            arrangedSubviews: [
                label,
                stepper
            ]
        )
        headerStackView.axis = .horizontal
                
        let stackView = UIStackView(
            arrangedSubviews: [
                headerStackView,
                textView,
                button
            ]
        )
        stackView.spacing = 10
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        button.addAction(UIAction { [unowned self] _ in
            insertZenmoji()
        }, for: .primaryActionTriggered)
        
        stepper.addAction(UIAction { [unowned self] _ in
            updateTextViewFontSize()
        }, for: .valueChanged)
    }
    
    func insertZenmoji() {
        let attributedText = makeAttributedText()
        textView.insertAttributedText(NSAttributedString(attributedText))
    }
    
    func updateTextViewFontSize() {
        textView.font = UIFont.systemFont(ofSize: stepper.value)
    }
    
    func makeAttributedText() -> AttributedString {
        let image = UIImage(resource: .blobcat)
        let provider = ImageContentProvider(image: image)
        let adaptiveImageGlyph = AttributedString.AdaptiveImageGlyph(provider: provider)
        let nsAdaptiveImageGlyph = NSAdaptiveImageGlyph(adaptiveImageGlyph)
        let nsAttributedString = NSAttributedString(adaptiveImageGlyph: nsAdaptiveImageGlyph)
        return AttributedString(nsAttributedString)
    }
}
