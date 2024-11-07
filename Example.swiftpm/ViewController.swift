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
        
        label.text = "Zenmoji Example"
        label.font = .preferredFont(forTextStyle: .headline)
        button.configuration?.title = "Insert ZenMoji"
        textView.supportsAdaptiveImageGlyph = true
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.separator.cgColor
        textView.layer.cornerRadius = 8
        stepper.value = 16
        
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
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            ),
            view.trailingAnchor.constraint(
                equalTo: stackView.safeAreaLayoutGuide.trailingAnchor,
                constant: 20
            ),
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
        let image = UIImage(resource: .blobcat)
        let adaptiveImageContent = AdaptiveImageContent(image: image)
        let adaptiveImageGlyph = NSAdaptiveImageGlyph(imageContent: adaptiveImageContent)
        let attributedText = NSAttributedString(adaptiveImageGlyph: adaptiveImageGlyph)
        textView.insertAttributedText(attributedText)
    }
    
    func updateTextViewFontSize() {
        textView.font = UIFont.systemFont(ofSize: stepper.value)
    }
}
