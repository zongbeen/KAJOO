//
//  TabBarViewController.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/10/03.
//
import UIKit

class ExampleTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let tabOne = UINavigationController(rootViewController: HomeTabVC()) // 뷰컨 품은 네비게이션 컨트롤러
        let tabOneBarItem = UITabBarItem(title: "탭 1", image: UIImage(named: "tab1"), tag: 0)
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = UINavigationController(rootViewController: OrderCoffeeTabVC()) // 뷰컨 품은 네비게이션 컨트롤러
        let tabTwoBarItem = UITabBarItem(title: "탭 2", image: UIImage(named: "tab2"), tag: 1)
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = UINavigationController(rootViewController: EventTabVC())
        let tabThreeBarItem = UITabBarItem(title: "탭 3", image: UIImage(named: "tab3"), tag: 2)
        tabThree.tabBarItem = tabThreeBarItem
        
        let tabFour = UINavigationController(rootViewController: OtherTabVC())
        let tabFourBarItem = UITabBarItem(title: "탭 4", image: UIImage(named: "tab4"), tag: 3)
        tabFour.tabBarItem = tabFourBarItem
        
        //탭바컨트롤러에 뷰 컨트롤러를 array형식으로 넣어주면 탭바가 완성됩니다.
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
        
        
    }
    
   

}
