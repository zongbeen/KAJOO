//
//  Menu.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/01.
//

import Foundation
import RealmSwift

class Menu: Object{
    @objc dynamic var saleNum: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var cream: Int = 0
    @objc dynamic var shot: Int = 0
    @objc dynamic var price: Int = 0
    
    override static func primaryKey() -> String? {
        return "saleNum"
    }
}
