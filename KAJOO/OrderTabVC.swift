//
//  OrderTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/27.
//

import UIKit

class OrderTabVC: UIViewController {
    
    @IBOutlet weak var CoffeeView: UIView!
    @IBOutlet weak var BeverageView: UIView!
    @IBOutlet weak var TeaView: UIView!
    @IBOutlet weak var ShoppingBasketBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            CoffeeView.alpha = 1
            BeverageView.alpha = 0
            TeaView.alpha = 0
        }
        else if sender.selectedSegmentIndex == 1 {
            CoffeeView.alpha = 0
            BeverageView.alpha = 1
            TeaView.alpha = 0
        } else {
            CoffeeView.alpha = 0
            BeverageView.alpha = 0
            TeaView.alpha = 1
        }
    }
    @IBAction func didTabShoppingBasketBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingCartVC") as! ShoppingCartVC
        self.present(secondViewController, animated: true, completion: nil)
    }
}
