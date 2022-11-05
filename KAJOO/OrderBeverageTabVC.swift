//
//  OrderBeverageTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/13.
//

import UIKit

class OrderBeverageTabVC: UIViewController {
    
    @IBOutlet weak var StrawberryDelightYourtBlended: UIImageView!
    @IBOutlet weak var MangoPassionFruitBlended: UIImageView!
    @IBOutlet weak var VanilaCreamFrappuccino: UIImageView!
    @IBOutlet weak var JavaChipFrappuccino: UIImageView!
    @IBOutlet weak var CaramelFrappuccino: UIImageView!
    @IBOutlet weak var WhiteChocolateMocha: UIImageView!

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // 상단 navigation bar 색상 변경.
        
        let availableStrawberryDelightYourtBlended = UITapGestureRecognizer(target: self, action: #selector(touchStrawberryDelightYourtBlended))
        StrawberryDelightYourtBlended.isUserInteractionEnabled = true
        StrawberryDelightYourtBlended.addGestureRecognizer(availableStrawberryDelightYourtBlended)
        

        let availableMangoPassionFruitBlended = UITapGestureRecognizer(target: self, action: #selector(touchMangoPassionFruitBlended))
        MangoPassionFruitBlended.isUserInteractionEnabled = true
        MangoPassionFruitBlended.addGestureRecognizer(availableMangoPassionFruitBlended)

        let availableVanilaCreamFrappuccino = UITapGestureRecognizer(target: self, action: #selector(touchVanilaCreamFrappuccino))
        VanilaCreamFrappuccino.isUserInteractionEnabled = true
        VanilaCreamFrappuccino.addGestureRecognizer(availableVanilaCreamFrappuccino)
        
        let availableJavaChipFrappuccino = UITapGestureRecognizer(target: self, action: #selector(touchJavaChipFrappuccino))
        JavaChipFrappuccino.isUserInteractionEnabled = true
        JavaChipFrappuccino.addGestureRecognizer(availableJavaChipFrappuccino)
        
        let availableCaramelFrappuccino = UITapGestureRecognizer(target: self, action: #selector(touchCaramelFrappuccino))
        CaramelFrappuccino.isUserInteractionEnabled = true
        CaramelFrappuccino.addGestureRecognizer(availableCaramelFrappuccino)
        
        let availableWhiteChocolateMocha = UITapGestureRecognizer(target: self, action: #selector(touchWhiteChocolateMocha))
        WhiteChocolateMocha.isUserInteractionEnabled = true
        WhiteChocolateMocha.addGestureRecognizer(availableWhiteChocolateMocha)
        
    }
    
    @objc func touchStrawberryDelightYourtBlended() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "딸기 딜라이트 요거트 블렌디드"
        secondViewController.price = 6300
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchMangoPassionFruitBlended() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "망고 패션 프루트 블렌디그"
        secondViewController.price = 5400
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    @objc func touchVanilaCreamFrappuccino() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "바닐라 크림 프라푸치노"
        secondViewController.price = 5100
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchJavaChipFrappuccino() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "자바칩 프라푸치노"
        secondViewController.price = 6300
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCaramelFrappuccino() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카라멜 프라푸치노"
        secondViewController.price = 5900
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchWhiteChocolateMocha() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "화이트 초콜릿 모카"
        secondViewController.price = 5900
        self.present(secondViewController, animated: true, completion: nil)
    }
}
