//
//  ProfileSelectViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ProfileSelectViewController: UIViewController {
    
    lazy var backButton         = UIButton()
    lazy var descript           = UILabel()
    lazy var descriptSelfie     = UILabel()
    lazy var selectImageButton  = UIButton()
    lazy var selfie             = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func goNext() {
        let view = ProfileResultViewController()
        view.modalPresentationStyle = .fullScreen
        
        // 아직 탭바나 이런게 정해지지 않아서 일단 프레젠트로
        self.present(view, animated: true)
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        self.backButton.do {
            $0.setImage(UIImage(named: "iconBackBlack"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
        }
        self.descript.do {
            $0.text = "친구들에게 보여줄\n프로필을 등록해주세요."
            $0.numberOfLines = 0
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 26)
            $0.textColor = .black
        }
        self.selectImageButton.do {
            $0.setTitle("앨범에서 가져오기", for: .normal)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.backgroundColor = #colorLiteral(red: 0.3529411765, green: 0.4196078431, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 30
            $0.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        }
        self.selfie.do {
            $0.image = UIImage(named: "selfie")
            $0.contentMode = .scaleAspectFit
        }
        self.descriptSelfie.do {
            $0.text = "셀피를 등록하면 친구들이 알아보기 좋아요 :D"
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            $0.textColor = .black
        }
    }
    
    private func layout() {
        [backButton, descript, selectImageButton, selfie, descriptSelfie]
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
        self.selectImageButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.width.equalTo(300)
            $0.height.equalTo(60)
        }
        self.descriptSelfie.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(self.selectImageButton.snp.top).offset(-10)
        }
        self.selfie.snp.makeConstraints {
            $0.top.equalTo(self.descript.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.descriptSelfie.snp.top)
        }
    }
}
