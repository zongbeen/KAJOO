//
//  OrderCoffeeTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/13.
//

import UIKit

class OrderCoffeeTabVC: UIViewController {
 
    @IBOutlet weak var Espresso: UIImageView!
    @IBOutlet weak var CaffeAmericano: UIImageView!
    @IBOutlet weak var DecafCaffeAmericano: UIImageView!
    @IBOutlet weak var CaffeLatte: UIImageView!
    @IBOutlet weak var Cappuccino: UIImageView!
    @IBOutlet weak var CaffeMocha: UIImageView!
    @IBOutlet weak var CaramelMacchiato: UIImageView!
    @IBOutlet weak var ColdBrew: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // 상단 navigation bar 색상 변경.
        
        let availableEspresso = UITapGestureRecognizer(target: self, action: #selector(touchEspresso))
        Espresso.isUserInteractionEnabled = true
        Espresso.addGestureRecognizer(availableEspresso)
        

        let availableCaffeAmericano = UITapGestureRecognizer(target: self, action: #selector(touchCaffeAmericano))
        CaffeAmericano.isUserInteractionEnabled = true
        CaffeAmericano.addGestureRecognizer(availableCaffeAmericano)

        let availableDecafCaffeAmericano = UITapGestureRecognizer(target: self, action: #selector(touchDecafCaffeAmericano))
        DecafCaffeAmericano.isUserInteractionEnabled = true
        DecafCaffeAmericano.addGestureRecognizer(availableDecafCaffeAmericano)
        
        let availableCaffeLatte = UITapGestureRecognizer(target: self, action: #selector(touchCaffeLatte))
        CaffeLatte.isUserInteractionEnabled = true
        CaffeLatte.addGestureRecognizer(availableCaffeLatte)
        
        let availableImgColdBrew = UITapGestureRecognizer(target: self, action: #selector(touchColdBrew))
        ColdBrew.isUserInteractionEnabled = true
        ColdBrew.addGestureRecognizer(availableImgColdBrew)
        
        let availableCappuccino = UITapGestureRecognizer(target: self, action: #selector(touchCappuccino))
        Cappuccino.isUserInteractionEnabled = true
        Cappuccino.addGestureRecognizer(availableCappuccino)
        
        let availableCaffeMocha = UITapGestureRecognizer(target: self, action: #selector(touchCaffeMocha))
        CaffeMocha.isUserInteractionEnabled = true
        CaffeMocha.addGestureRecognizer(availableCaffeMocha)
        
        let availableCaramelMacchiato = UITapGestureRecognizer(target: self, action: #selector(touchCaramelMacchiato))
        CaramelMacchiato.isUserInteractionEnabled = true
        CaramelMacchiato.addGestureRecognizer(availableCaramelMacchiato)
        
    }
    @objc func touchEspresso() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "에스프레소"
        secondViewController.price = 4000
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCaffeAmericano() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카페 아메리카노"
        secondViewController.price = 4500
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    @objc func touchDecafCaffeAmericano() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "디카페인 카페 아메리카노"
        secondViewController.price = 4800
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCaffeLatte() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카페 라떼"
        secondViewController.price = 5000
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchColdBrew() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "콜드 브루"
        secondViewController.price = 4900
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCappuccino() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카푸치노"
        secondViewController.price = 5000
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCaffeMocha() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카페모카"
        secondViewController.price = 5500
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchCaramelMacchiato() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "카라멜 마키아또"
        secondViewController.price = 5900
        self.present(secondViewController, animated: true, completion: nil)
    }

}
