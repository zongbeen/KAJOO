//
//  LogOutVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/04.
//

import UIKit
import Firebase

class LogOutVC: UIViewController {
    
    @IBOutlet var CheckMsg: UILabel!
    @IBOutlet var YesBtn: UIButton!
    @IBOutlet var NoBtn: UIButton!
    
    
    @IBAction func tabYesBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("로그아웃 성공")
            //self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true)
        }catch let signOutError as NSError{
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    @IBAction func tabNoBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
