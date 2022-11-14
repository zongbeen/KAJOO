//
//  PayVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/09.
//

import UIKit
import RealmSwift
import FirebaseFirestore

class PayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var realm: Realm = {
        return try! Realm()
    }()
    var cellList: [String] = ["22년11월10일 주문 내역"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayCell", for: indexPath) as! PayCell
        cell.list.text = cellList[indexPath.row]
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        }
    
    
}
