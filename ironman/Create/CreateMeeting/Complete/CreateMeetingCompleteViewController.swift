//
//  CreateMeetingCompleteViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/29.
//

import UIKit

class CreateMeetingCompleteViewController: UIViewController {
    let checkImageView = UIImageView()
    let titleLabel = HeadingLabel(text: "약속 만들기 완료!")
    let dateButton = BaseGrayButton(icon: "🗓", text: "01.03 일요일 ∙ 오후 1시")
    let placeButton = UIButton()
    let flagLabel = UILabel()
    let addressLabel = UILabel()
    let placeNameLabel = UILabel()
    let memberButton = BaseGrayButton(icon: "👫", text: "5명 참석")
    let penaltyButton = BaseGrayButton(icon: "💩", text: "벌칙 : 지각자들이 커피사기")
    let memoButton = ChevronGrayButton(icon: "✏️", text: "우석 빌라 502호로 오세요~올때 블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라")
    let goToHomeButton = UIButton()
    let linkShareButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
}

// MARK: attribute & layout

extension CreateMeetingCompleteViewController {
    
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        checkImageView.do {
            $0.image = UIImage(named: "check")
        }
        titleLabel.do {
            $0.textAlignment = .center
        }
        placeButton.do {
            $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03)
            $0.layer.cornerRadius = 14
            $0.layer.masksToBounds = true
        }
        flagLabel.do {
            $0.text = "⛳️"
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 20)
        }
        addressLabel.do {
            $0.textColor = UIColor(red: 0.042, green: 0.042, blue: 0.042, alpha: 0.5)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
            $0.text = "수원시 팔달구 덕영동"
        }
        placeNameLabel.do {
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 15)
            $0.text = "카카오 프렌즈 수원 AK점"
        }
        memoButton.do {
            $0.textLabel.numberOfLines = 3
        }
        goToHomeButton.do {
            $0.setTitle("홈으로 이동", for: .normal)
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
            $0.backgroundColor = UIColor(red: 0.923, green: 0.931, blue: 1, alpha: 1)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.setTitleColor(UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1), for: .normal)
        }
        linkShareButton.do {
            $0.setTitle("초대 링크 공유", for: .normal)
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
            $0.backgroundColor = UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1)
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.titleLabel?.textColor = .white
        }
    }
    
    func layout() {
        [checkImageView,
         titleLabel,
         dateButton,
         placeButton,
         memberButton,
         penaltyButton,
         memoButton,
         goToHomeButton,
         linkShareButton].forEach { view.addSubview($0) }
        [flagLabel, addressLabel, placeNameLabel].forEach { placeButton.addSubview($0) }
        
        checkImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(74)
            $0.width.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(checkImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(35)
        }
        dateButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(29)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(62)
        }
        placeButton.snp.makeConstraints {
            $0.top.equalTo(dateButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(82)
        }
        flagLabel.snp.makeConstraints {
            $0.top.equalTo(placeButton).offset(19)
            $0.leading.equalTo(placeButton).offset(16)
            $0.height.width.equalTo(24)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalTo(flagLabel.snp.trailing).offset(14)
            $0.top.equalTo(placeButton).offset(19)
        }
        placeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(flagLabel.snp.trailing).offset(14)
            $0.bottom.equalTo(placeButton.snp.bottom).offset(-19)
        }
        memberButton.snp.makeConstraints {
            $0.top.equalTo(placeButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(62)
        }
        penaltyButton.snp.makeConstraints {
            $0.top.equalTo(memberButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(62)
        }
        memoButton.snp.makeConstraints {
            $0.top.equalTo(penaltyButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        goToHomeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-44)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(view.snp.centerX).offset(-2)
            $0.height.equalTo(57)
        }
        linkShareButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-44)
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalTo(view.snp.centerX).offset(2)
            $0.height.equalTo(57)
        }
    }
}
