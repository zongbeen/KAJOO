//
//  PayVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/09.
//

import UIKit
import RealmSwift
import FirebaseFirestore
import Firebase

class PayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let db = Firestore.firestore()

    var cellList: [String] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.collection("Pay").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    print(document.documentID)
                    let count = document.documentID.count
                    for i in 0...(count){
                        self.cellList.append(document.documentID)
                    }
                }
            } else {
                // error. do something
            }
        }
        
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
    //테이블 셀 클릭
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//
//            tableView.deselectRow(at: indexPath, animated: true)
//
//            let item = String(number[indexPath.row])
//
//            //MARK: Alert 창
//            let alert = UIAlertController(title: "Click Number", message: item, preferredStyle: UIAlertController.Style.alert)
//            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//            alert.addAction(action)
//            self.present(alert, animated: true)
//        }
    
}
