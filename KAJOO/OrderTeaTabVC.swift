//
//  OrderTeaTabVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/13.
//

import UIKit

class OrderTeaTabVC: UIViewController {
    
    @IBOutlet weak var EarlGreyBrewedTea: UIImageView!
    @IBOutlet weak var YujaMintTea: UIImageView!
    @IBOutlet weak var GrapefruitHoneyBlackTea: UIImageView!
    @IBOutlet weak var JejuOrganicGreenTea: UIImageView!
    @IBOutlet weak var ChamomileBlendedBrewedTea: UIImageView!
    @IBOutlet weak var HibiscusBlendedBrewedTea: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // 상단 navigation bar 색상 변경.
        
        let availableEarlGreyBrewedTea = UITapGestureRecognizer(target: self, action: #selector(touchEarlGreyBrewedTea))
        EarlGreyBrewedTea.isUserInteractionEnabled = true
        EarlGreyBrewedTea.addGestureRecognizer(availableEarlGreyBrewedTea)
        

        let availableYujaMintTea = UITapGestureRecognizer(target: self, action: #selector(touchYujaMintTea))
        YujaMintTea.isUserInteractionEnabled = true
        YujaMintTea.addGestureRecognizer(availableYujaMintTea)

        let availableGrapefruitHoneyBlackTea = UITapGestureRecognizer(target: self, action: #selector(touchGrapefruitHoneyBlackTea))
        GrapefruitHoneyBlackTea.isUserInteractionEnabled = true
        GrapefruitHoneyBlackTea.addGestureRecognizer(availableGrapefruitHoneyBlackTea)
        
        let availableJejuOrganicGreenTea = UITapGestureRecognizer(target: self, action: #selector(touchJejuOrganicGreenTea))
        JejuOrganicGreenTea.isUserInteractionEnabled = true
        JejuOrganicGreenTea.addGestureRecognizer(availableJejuOrganicGreenTea)
        
        let availableChamomileBlendedBrewedTea = UITapGestureRecognizer(target: self, action: #selector(touchChamomileBlendedBrewedTea))
        ChamomileBlendedBrewedTea.isUserInteractionEnabled = true
        ChamomileBlendedBrewedTea.addGestureRecognizer(availableChamomileBlendedBrewedTea)
        
        let availableHibiscusBlendedBrewedTea = UITapGestureRecognizer(target: self, action: #selector(touchHibiscusBlendedBrewedTea))
        HibiscusBlendedBrewedTea.isUserInteractionEnabled = true
        HibiscusBlendedBrewedTea.addGestureRecognizer(availableHibiscusBlendedBrewedTea)
        
    }
    
    @objc func touchEarlGreyBrewedTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "얼 그레이 티"
        secondViewController.price = 4500
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchYujaMintTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "유자 민트 티"
        secondViewController.price = 5900
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    @objc func touchGrapefruitHoneyBlackTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "자몽 허니 블랙 티"
        secondViewController.price = 5700
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchJejuOrganicGreenTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "제주 유기 녹차"
        secondViewController.price = 5300
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchChamomileBlendedBrewedTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "캐모마일 블랜드 티"
        secondViewController.price = 4500
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @objc func touchHibiscusBlendedBrewedTea() {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderOptionTabVC") as! OrderOptionTabVC
        secondViewController.result = "히비스커스 블렌드 티"
        secondViewController.price = 4500
        self.present(secondViewController, animated: true, completion: nil)
    }
    
}
