//
//  HeaderView.swift
//  KAJOO
//
//  Created by 한종빈 on 2022/11/04.
//

import UIKit

class HeaderView: UIView {

    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "person.fill")
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .black
        iv.layer.cornerRadius = 120 / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}
