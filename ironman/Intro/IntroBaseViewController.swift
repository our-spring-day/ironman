//
//  IntroBaseViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class IntroBaseViewController: UIViewController {
    
    lazy var backButton         = UIButton()
    lazy var descript           = UILabel()
    lazy var completeButton     = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func attribute() {
        self.view.backgroundColor = .white
        self.backButton.do {
            $0.setImage(UIImage(named: "iconBackBlack"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        self.descript.do {
            $0.numberOfLines = 0
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 26)
            $0.textColor = .black
        }
        self.completeButton.do {
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 30
        }
    }
    
    func layout() {
        [backButton, descript, completeButton]
            .forEach { self.view.addSubview($0) }
        
        self.backButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15.75)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(19.75)
            $0.width.equalTo(19)
            $0.height.equalTo(16)
        }
        self.descript.snp.makeConstraints {
            $0.top.equalTo(self.backButton.snp.bottom).offset(14)
            $0.leading.equalTo(30)
        }
        self.completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
    }
}
