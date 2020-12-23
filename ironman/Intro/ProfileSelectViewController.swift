//
//  ProfileSelectViewController.swift
//  ironman
//
//  Created by once on 2020/12/23.
//

import UIKit

class ProfileSelectViewController: IntroBaseViewController {
    
    lazy var descriptSelfie     = UILabel()
    lazy var selectImageButton  = UIButton()
    lazy var selfie             = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }

    @objc func goNext() {
        let view = ProfileResultViewController()
        view.modalPresentationStyle = .fullScreen
        
        // 아직 탭바나 이런게 정해지지 않아서 일단 프레젠트로
        self.present(view, animated: true)
    }
    
    override func attribute() {
        super.attribute()
        
        self.completeButton.isHidden = true
        
        self.descript.do {
            $0.text = "친구들에게 보여줄\n프로필을 등록해주세요."
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
    
    override func layout() {
        super.layout()
        [selectImageButton, selfie, descriptSelfie]
            .forEach { self.view.addSubview($0) }
        
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
