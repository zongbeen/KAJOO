//
//  SignUpViewController.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/09/25.
//

import UIKit
import Firebase

class SignUpViewControoler: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet var LogoView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            /*guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") as? UITabBarController else {
                return
            }
            self.navigationController?.pushViewController(nextVC, animated: true)*/
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        
        emailTextField.placeholder = "email을 입력해주세요"
        emailTextField.borderStyle = .bezel
        pwTextField.placeholder = "password를 입력해주세요"
        pwTextField.borderStyle = .bezel
        pwTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func tabLoginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: pwTextField.text!) { (user, error) in
            if user != nil {
                print("로그인 성공")
                guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") else {return}
                nextVC.modalPresentationStyle = .fullScreen
                self.present(nextVC, animated: true)
            }
            else {
                print("로그인 실패")
                let LoginFailLabel = UILabel(frame: CGRect(x: 20, y: 585, width: 388, height: 45))
                LoginFailLabel.text = "이메일과 비밀번호를 확인해주세요"
                LoginFailLabel.textColor = UIColor.red
                LoginFailLabel.tag = 100
                self.view.addSubview(LoginFailLabel)
            }
        }
    }
    @IBAction func tabSignInView(_ sender: UIButton) {
        /*guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)*/
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignInViewController") else {return}
        self.present(nextVC, animated: true)
    }
}
