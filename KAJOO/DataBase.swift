//
//  DataBase.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/01.
//

import Foundation
import RealmSwift

class CartList: Object {
    @objc dynamic var cartNum: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
    @objc dynamic var cream: Int = 0
    @objc dynamic var shot: Int = 0
    @objc dynamic var price: Int = 0
    
    override static func primaryKey() -> String? {
        return "cartNum"
    }
}
class PayList: Object {
    @objc dynamic var payNum: String = ""
    @objc dynamic var payname: String = ""
    @objc dynamic var payprice: Int = 0

    override static func primaryKey() -> String? {
        return "payNum"
    }
}
//let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//let realmURLs = [
//    realmURL,
//    realmURL.appendingPathExtension("lock"),
//    realmURL.appendingPathExtension("note"),
//    realmURL.appendingPathExtension("management")
//]
//for URL in realmURLs {
//    do {
//        try FileManager.default.removeItem(at: URL)
//    } catch {
//        // handle error
//    }
//}
