import UIKit

final class ViewController: UIViewController {

    // MARK: - UI Element

    @IBOutlet
    weak var button: UIButton!
    
    @IBOutlet
    weak var passwordTextField: UITextField!
    
    @IBOutlet
    weak var passwordLabel: UILabel!

    @IBOutlet
    weak var generatePasswordButton: UIButton!

    @IBOutlet
    weak var stopGeneratePasswordButton: UIButton!

    @IBOutlet
    weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Details

    private var isBlack = false {
        didSet {
            view.backgroundColor = isBlack ? .black : .white
        }
    }

    private var isPasswordGenerated = false {
        didSet {
            generatePasswordButton.isEnabled = !isPasswordGenerated
            stopGeneratePasswordButton.isEnabled = isPasswordGenerated
        }
    }

    private let passwordSelection = PasswordSelection()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        passwordSelection.delegate = self
        activityIndicator.hidesWhenStopped = true
    }

    // MARK: - Actions
    
    @IBAction
    func onBut(_ sender: Any) {
        isBlack.toggle()
    }

    @IBAction
    func generateButtonTapped() {
        isPasswordGenerated = true
    }

    @IBAction
    func stopGenerateButtonTapped() {
        isPasswordGenerated = false
    }
}

protocol ViewDelegate {
    func appdateLabel(with text: String)
    func finishPasswordGenerate(with text: String)
}

extension ViewController: ViewDelegate{
    func appdateLabel(with text: String) {
        passwordLabel.text = text
    }

    func finishPasswordGenerate(with text: String) {
        isPasswordGenerated = false
        passwordLabel.text = text
        activityIndicator.stopAnimating()
    }
}

