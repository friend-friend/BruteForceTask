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

    // MARK: - Details

    private var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
            }
        }
    }

    private var isPasswordGenerated = false {
        didSet {
            generatePasswordButton.isEnabled = !isPasswordGenerated
            stopGeneratePasswordButton.isEnabled = isPasswordGenerated
        }
    }
    
    @IBAction func onBut(_ sender: Any) {
        isBlack.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

