//
//  OrderOptionTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/13.
//

import UIKit
import RealmSwift

class OrderOptionTabVC: UIViewController {
    lazy var realm: Realm = {
        return try! Realm()
    }()
    
    @IBOutlet weak var coffeName: UILabel!
    @IBOutlet weak var IcedBtn: UIButton!
    @IBOutlet weak var HotBtn: UIButton!

    var result: String = "" // 커피 이름
    var price: Int = 0
    let addPrice: Int = 500
    var priceResult: Int = 0
    var totalResult: Int = 0
    var shotResult: Int = 0
    var creamResult: Int = 0
    
    @IBOutlet weak var creamStepper: UIStepper!
    @IBOutlet weak var shotStepper: UIStepper!
    @IBOutlet weak var totalStepper: UIStepper!
    
    @IBOutlet weak var creamLabel: UILabel!
    @IBOutlet weak var creamValueLabel: UILabel!
    @IBOutlet weak var shotLabel: UILabel!
    @IBOutlet weak var shotValueLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel! // 몇 잔
    @IBOutlet weak var priceLabel: UILabel! // 가격
    
    //@IBOutlet weak var closeButton: UIButton! // 취소하기 버튼
    @IBOutlet weak var shoppingButton: UIButton! // 장바구니에 담기 버튼
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coffeName.text = result // 커피 이름 설정
        totalStepper.wraps = true
        totalStepper.autorepeat = true
        totalStepper.maximumValue = 20
        HotBtn.layer.borderWidth = 2
        HotBtn.layer.borderColor = UIColor.red.cgColor
        IcedBtn.layer.borderWidth = 2
        IcedBtn.layer.borderColor = UIColor.blue.cgColor
    }

    @IBAction func selectedIcedBtn(_ sender: Any) {
        self.IcedBtn.isSelected = true
        self.HotBtn.isSelected = false
        self.IcedBtn.backgroundColor = UIColor.blue
        self.IcedBtn.tintColor = UIColor.white
        self.HotBtn.backgroundColor = UIColor.white
        self.HotBtn.tintColor = UIColor.red
        self.HotBtn.layer.borderWidth = 2
        self.HotBtn.layer.borderColor = UIColor.red.cgColor
    }
    @IBAction func selectedHotBtn(_ sender: Any) {
        self.HotBtn.isSelected = true
        self.IcedBtn.isSelected = false
        self.HotBtn.backgroundColor = UIColor.red
        self.HotBtn.tintColor = UIColor.white
        self.IcedBtn.backgroundColor = UIColor.white
        self.IcedBtn.tintColor = UIColor.blue
        self.IcedBtn.layer.borderWidth = 2
        self.IcedBtn.layer.borderColor = UIColor.blue.cgColor
    }
    
    func sumPrice() {
        priceResult = totalResult + shotResult + creamResult
        priceLabel.text = priceResult.description
        
    }
    
    @IBAction func creamStepperValueChanged(_ sender: UIStepper) {
        creamValueLabel.text = Int(sender.value).description
        creamResult = (Int(sender.value) * addPrice)
        sumPrice()
    }
    
    @IBAction func totalStepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = Int(sender.value).description // 커피 잔 개수
        totalResult = (Int(sender.value) * price)
        sumPrice()
    }
    
    @IBAction func shotStepperValueChanged(_ sender: UIStepper) {
        shotValueLabel.text = Int(sender.value).description
        shotResult = (Int(sender.value)*addPrice)
        sumPrice()
    }

    @IBAction func tapShoppingButton(_ sender: UIButton) {
        func insert() {
            let list = CartList()
            var formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMddHHmmss"
            var currentTime = formatter.string(from: Date())

            list.cartNum = Int(currentTime) ?? 0
            list.name = result
            list.count = Int(valueLabel.text!) ?? 0
            list.price = priceResult
            list.shot = Int(shotValueLabel.text!) ?? 0
            list.cream = Int(creamValueLabel.text!) ?? 0
            print(list)

            try! realm.write {
                realm.add(list)
            }
        }
        insert()
        
//        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
//        let realmURLs = [
//            realmURL,
//            realmURL.appendingPathExtension("lock"),
//            realmURL.appendingPathExtension("note"),
//            realmURL.appendingPathExtension("management")
//        ]
//        for URL in realmURLs {
//            do {
//                try FileManager.default.removeItem(at: URL)
//            } catch {
//                // handle error
//            }
//        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        dismiss(animated: false, completion: nil)
    }

}
