//
//  OtherTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/03.
//

import UIKit

class OtherTabVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellList = ["정보수정", "결제내역", "매장찾기", "로그아웃"]

    @IBOutlet weak var tableView: UITableView!
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreCell", for: indexPath) as! MoreCell
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "UpdateUserVC", sender: indexPath)
        case 1: self.performSegue(withIdentifier: "PayVC", sender: indexPath)
        case 2: self.performSegue(withIdentifier: "FindStoreVC", sender: indexPath)
        case 3: self.performSegue(withIdentifier: "LogOutVC", sender: indexPath)
        default:
            return
        }
    }
    
}

extension OtherTabVC {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
}
