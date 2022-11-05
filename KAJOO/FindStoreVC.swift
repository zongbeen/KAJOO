//
//  FindStoreVC.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/03.
//

import CoreLocation
import NMapsMap

class FindStoreVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
    }
}
