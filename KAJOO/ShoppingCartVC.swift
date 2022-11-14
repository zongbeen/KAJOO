//
//  ShoppingCartVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/12.
//

import UIKit
import RealmSwift
import FirebaseFirestore

class ShoppingCartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    var nameList: [String] = []
    var priceList: [String] = []
    var intPrice: [Int] = []
    var countList: [Int] = []
    @IBOutlet var payBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cart = realm.objects(CartList.self)
        let count1 = cart.filter("cartNum >= 0").count
        for i in 0...(count1){
            if i >= cart.startIndex && i < cart.endIndex {
                nameList.append(cart[i].name)
                priceList.append(String(cart[i].price))
                intPrice.append(cart[i].price)
                countList.append(cart[i].count)
            }
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
        let db = Firestore.firestore()
        
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        var currentTime = formatter.string(from: Date())
        
        let totalCount = countList.reduce(0, +)
        let totalPrice = intPrice.reduce(0, +)
        
        let path = db.collection("Pay").addDocument(data: [:])
        path.updateData(["Num": currentTime,
                         "Name": FieldValue.arrayUnion(nameList),
                         "Price": totalPrice,
                         "Count": totalCount])
        func insert() {
            let cartList = CartList()
            let payList = PayList()
            
            payList.payNum = cartList.cartNum
            payList.payName = cartList.name
            payList.payPrice = cartList.price
            
        }
        insert()
        let alret = UIAlertController(title: "결제 완료", message: "결제가 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let yes = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in
            self.dismiss(animated: true)
        }
        alret.addAction(yes)
        self.present(alret, animated: true, completion: nil)
        //dismiss(animated: false, completion: nil)
    }
}
