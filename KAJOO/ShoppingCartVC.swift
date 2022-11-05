//
//  ShoppingCartVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/04.
//

import UIKit
import RealmSwift

class ShoppingCartVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    var nameList: [String] = []
    var priceList: [String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cart = realm.objects(CartList.self)
        for i in 0...4 {
            if cart[i].name.isEmpty{
                break
            }else {
                nameList.append(cart[i].name)
                priceList.append(String(cart[i].price))
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
    @IBAction func backBtn(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

}
