//
//  EventTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/03.
//

import UIKit

class EventTabVC: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var EventLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func didBtn(_ sender: Any) {
        
    }
    
    @IBAction func didTabButton(_ sender: Any) {
        if let url = URL(string: "http://www.naver.com"){
            UIApplication.shared.open(url, options: [:])
        }
    }
}
