//
//  EventTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/03.
//

import UIKit

class EventTabVC: UIViewController {


    @IBOutlet weak var eventBtn1: UIButton!
    @IBOutlet weak var eventBtn2: UIButton!
    @IBOutlet weak var eventBtn3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTabEventBtn1(_ sender: Any) {
        if let url = URL(string: "http://www.naver.com"){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func didTabEventBtn2(_ sender: Any) {
        if let url = URL(string: "http://www.google.co.kr"){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func didTabEventBtn3(_ sender: Any) {
        if let url = URL(string: "http://www.daum.net"){
            UIApplication.shared.open(url, options: [:])
        }
    }
}
