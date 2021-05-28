//
//  PlaceSearchViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class PlaceSearchViewController: UIViewController {
    let backButton = BackButton()
    let searchTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension PlaceSearchViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        searchTextField.do {
            $0.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.965, alpha: 1)
            $0.layer.cornerRadius = 22
            $0.layer.masksToBounds = true
            $0.clearButtonMode = .whileEditing
            $0.placeholder = "zz"
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 16)
            $0.addLeftPadding(padding: 17)
        }
    }
    
    func layout() {
        [backButton, searchTextField].forEach { view.addSubview($0) }

        backButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(19.51)
        }
        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(47)
            $0.leading.equalTo(backButton.snp.trailing).offset(10.49)
            $0.trailing.equalToSuperview().offset(-15)
            $0.height.equalTo(44)
        }
    }
}
