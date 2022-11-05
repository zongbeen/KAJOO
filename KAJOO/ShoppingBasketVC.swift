//
//  ShoppingBasketVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/13.
//

import UIKit
import RealmSwift

class ShoppingBasketVC: UIViewController {
    lazy var realm: Realm = {
        return try! Realm()
    }()
    var count = 0
    @IBOutlet weak var cart1: UILabel!
    @IBOutlet weak var cart2: UILabel!
    @IBOutlet weak var cart3: UILabel!
    @IBOutlet weak var cart4: UILabel!
    @IBOutlet weak var cart5: UILabel!

    
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var price3: UILabel!
    @IBOutlet weak var price4: UILabel!
    @IBOutlet weak var price5: UILabel!

    
    @IBOutlet weak var delBtn1: UIButton!
    @IBOutlet weak var delBtn2: UIButton!
    @IBOutlet weak var delBtn3: UIButton!
    @IBOutlet weak var delBtn4: UIButton!
    @IBOutlet weak var delBtn5: UIButton!

    
    @IBOutlet weak var researchBtn: UIButton!
    
    lazy var priceLabel : [UILabel] = [price1,price2,price3,price4,price5]
    lazy var cartLabel : [UILabel] = [cart1,cart2,cart3,cart4,cart5]
    lazy var delBtn : [UIButton] = [delBtn1,delBtn2,delBtn3,delBtn4,delBtn5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cart = realm.objects(CartList.self)
        
        for i in 0...1{
            cartLabel[i].text = cart[i].name
            priceLabel[i].text = String(cart[i].price)
            delBtn[i].addTarget(self, action: #selector(tabDelBtn1), for: .touchUpInside)
            /*if cart[0].name.isEmpty {
                cart1.text = ""
                price1.text = ""
                delBtn1.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart1.text = cart[0].name
                price1.text = String(cart[0].price)
                delBtn1.addTarget(self, action: #selector(tabDelBtn1), for: .touchUpInside)
            }
            if cart[1].name.isEmpty {
                cart2.text = ""
                price2.text = ""
                delBtn2.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart2.text = cart[1].name
                price2.text = String(cart[1].price)
                delBtn2.addTarget(self, action: #selector(tabDelBtn2), for: .touchUpInside)
            }
            if cart[2].name.isEmpty {
                cart3.text = ""
                price3.text = ""
                delBtn3.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart3.text = cart[2].name
                price3.text = String(cart[2].price)
                delBtn3.addTarget(self, action: #selector(tabDelBtn3), for: .touchUpInside)
            }
            if cart[3].name.isEmpty {
                cart4.text = ""
                price4.text = ""
                delBtn4.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart4.text = cart[3].name
                price4.text = String(cart[3].price)
                delBtn4.addTarget(self, action: #selector(tabDelBtn4), for: .touchUpInside)
            }
            if cart[4].name.isEmpty {
                cart5.text = ""
                price5.text = ""
                delBtn5.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart5.text = cart[4].name
                price5.text = String(cart[4].price)
                delBtn5.addTarget(self, action: #selector(tabDelBtn5), for: .touchUpInside)
            }
            if cart[5].name.isEmpty {
                cart6.text = ""
                price6.text = ""
                delBtn6.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart6.text = cart[5].name
                price6.text = String(cart[5].price)
                delBtn6.addTarget(self, action: #selector(tabDelBtn6), for: .touchUpInside)
            }
            if cart[6].name.isEmpty {
                cart7.text = ""
                price7.text = ""
                delBtn7.setTitle("", for: UIControl.State.normal)
                
            }
            else {
                cart7.text = cart[6].name
                price7.text = String(cart[6].price)
                delBtn7.addTarget(self, action: #selector(tabDelBtn7), for: .touchUpInside)
            }
            if cart[7].name.isEmpty {
                cart8.text = ""
                price8.text = ""
                delBtn8.setTitle("", for: UIControl.State.normal)
            }
            else {
                cart8.text = cart[7].name
                price8.text = String(cart[7].price)
                delBtn8.addTarget(self, action: #selector(tabDelBtn8), for: .touchUpInside)
            }
            if cart[8].name.isEmpty {
                cart9.text = ""
                price9.text = ""
                delBtn9.setTitle("", for: UIControl.State.normal)
                
            }
            else {
                cart9.text = cart[8].name
                price9.text = String(cart[8].price)
                delBtn9.addTarget(self, action: #selector(tabDelBtn9), for: .touchUpInside)
            }
            if cart[9].name.isEmpty {
                cart10.text = ""
                price10.text = ""
                delBtn10.setTitle("", for: UIControl.State.normal)
                
            }
            else {
                cart10.text = cart[9].name
                price10.text = String(cart[9].price)
                delBtn10.addTarget(self, action: #selector(tabDelBtn9), for: .touchUpInside)
            }*/
        }
    }

    /*@IBAction func didTabResearchBtn(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        for i in 0...9 {
            cartLabel[i].text = cart[i].name
            priceLabel[i].text = String(cart[i].price)
        }
    }*/
    @objc func tabDelBtn1(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[0])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn2(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[1])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn3(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[2])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn4(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[3])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn5(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[4])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn6(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[5])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn7(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[6])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn8(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[7])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn9(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[8])
        }
        dismiss(animated: false, completion: nil)
    }
    @objc func tabDelBtn10(_ sender: Any) {
        let cart = realm.objects(CartList.self)
        try! realm.write{
            realm.delete(cart[9])
        }
        dismiss(animated: false, completion: nil)
    }
}

