import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "이름을 입력해주세요"
        nameTextField.borderStyle = .bezel
        
        emailTextField.placeholder = "email을 입력해주세요"
        emailTextField.borderStyle = .bezel
        
        pwTextField.placeholder = "password를 입력해주세요"
        pwTextField.borderStyle = .bezel
        pwTextField.isSecureTextEntry = true //*표시
        
        phoneTextField.placeholder = "전화번호를 입력해주세요"
        phoneTextField.borderStyle = .bezel
        
    }
    @IBAction func tabOkButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!
        ) { (user, error) in
            if user != nil{
                print("회원가입 완료")
                let alret = UIAlertController(title: "회원가입 완료", message: "회원이 되신 것을 축하드립니다!", preferredStyle: UIAlertController.Style.alert)
                let yes = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in
                    self.dismiss(animated: true)
                }
                alret.addAction(yes)
                self.present(alret, animated: true, completion: nil)
            }
            else{
                print("회원가입 실패")
            }
        }
    }
    @IBAction func tabBackButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
