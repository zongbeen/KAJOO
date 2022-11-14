//
//  UserUpdate.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/07.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserUpdate: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetPwBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPwBtn.isHidden = !isEmailSignIn //다른 방식의 로그인을 했다면 숨기기
    }
    
    @IBAction func tapResetPwBtn(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
        let alret = UIAlertController(title: "이메일 전송 완료", message: "이메일 확인 부탁드립니다!", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in
            self.dismiss(animated: true)
        }
        alret.addAction(yes)
        self.present(alret, animated: true, completion: nil)
    }
}

