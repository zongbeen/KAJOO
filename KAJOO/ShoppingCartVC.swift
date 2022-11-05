//
//  ShoppingCartVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/04.
//

import UIKit
import RealmSwift
import SQLite3

class ShoppingCartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    var nameList: [String] = []
    var priceList: [String] = []
    @IBOutlet var payBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cart = realm.objects(CartList.self)
        //let count1 = cart.filter("price >= 0").count
        for i in 0...4{
            nameList.append(cart[i].name)
            priceList.append(String(cart[i].price))
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ShoppingCell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath) as! ShoppingCell
        ShoppingCell.cart.text = nameList[indexPath.row]
        ShoppingCell.priceLabel.text = priceList[indexPath.row]
        return ShoppingCell
    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .normal, title: "Delete"){(UIContextualAction,UIView,success: @escaping(Bool) -> Void) in print("delteAction클릭")
//            let cart = self.realm.objects(CartList.self)
//            try! self.realm.write{
//                self.realm.delete(cart[0])
//            }
//            success(true)
//        }
//        deleteAction.backgroundColor = .systemRed
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                nameList.remove(at: indexPath.row)
                priceList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                let cart = realm.objects(CartList.self)
                try! realm.write{
                    realm.delete(cart[indexPath.row])
                }
            }else if editingStyle == .insert {
             }
        }
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func tabPayBtn(_ sender: Any) {
        func cartToPay() {
            let cartList = CartList()
            let payList = PayList()
            payList.payNum = cartList.cartNum
            payList.payname = cartList.name
            payList.payprice = cartList.price
            print(payList)
            try! realm.write{
                realm.add(payList)
            }
        }
        cartToPay()
        
    }
    
}
