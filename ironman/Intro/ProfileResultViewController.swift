//
//  ProfileResultViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ProfileResultViewController: UIViewController {
    
    lazy var backButton         = UIButton()
    lazy var descript           = UILabel()
    lazy var reviseButton       = UIButton()
    lazy var nextButton         = UIButton()
    lazy var profileImage       = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
   
    private func attribute() {
        self.view.backgroundColor = .white
        self.backButton.do {
            $0.setImage(UIImage(named: "iconBackBlack"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        self.descript.do {
            $0.text = "멋진 사진이네요!\n이대로 진행할까요?"
            $0.numberOfLines = 0
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 26)
            $0.textColor = .black
        }
        self.nextButton.do {
            $0.setTitle("다음 단계로", for: .normal)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 30
            $0.isEnabled = false
        }
        self.reviseButton.do {
            $0.setTitle("다시 수정할래요", for: .normal)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.setTitleColor(#colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1), for: .normal)
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 30
        }
        self.profileImage.do {
            $0.image = UIImage(named: "profile")
            $0.layer.cornerRadius = 70
            $0.layer.masksToBounds = true
        }
    }
    
    private func layout() {
        [backButton, descript, reviseButton, nextButton, profileImage].forEach{ self.view.addSubview($0) }
        
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
        self.nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
        self.reviseButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.nextButton.snp.top).offset(-12)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
        self.profileImage.snp.makeConstraints {
            $0.top.equalTo(self.descript.snp.bottom).offset(98)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
