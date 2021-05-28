//
//  DatePickViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/27.
//

import UIKit

class DatePickViewController: UIViewController {
    let backButton = BackButton()
    let titleLabel = CreateDetailTitleLabel(text: "날짜 선택")
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let guideLabel = CreateMeetingGuideButton(text: "날짜를 선택해주세요:)")
    let datePicker = UIDatePicker()
    let confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
    }
}

// MARK: attribute & layout

extension DatePickViewController {
    func attribute() {
        view.do {
            $0.backgroundColor = .white
        }
        dateLabel.do {
            //디자인 가이드에있는 글씨체 써야하는지 확인해보고 적절히 사용해보자 노토산스는 일단 아님
            $0.textColor = UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 30)
            $0.text = "2021.02.21 일요일"
        }
        timeLabel.do {
            $0.textColor = .black
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 30)
            $0.text = "오후 02:00"
        }
        datePicker.do {
            $0.preferredDatePickerStyle = .wheels
            $0.datePickerMode = .dateAndTime
            $0.locale = Locale(identifier: "ko-KR")
            $0.timeZone = .autoupdatingCurrent
            $0.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        }
        confirmButton.do {
            $0.backgroundColor = UIColor(red: 0.354, green: 0.421, blue: 1, alpha: 1)
            $0.layer.cornerRadius = 22
            $0.layer.masksToBounds = true
            $0.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
            $0.setTitle("확인", for: .normal)
        }
    }
    
    func layout() {
        [backButton,
         titleLabel,
         dateLabel,
         timeLabel,
         guideLabel,
         datePicker,
         confirmButton].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(66)
            $0.leading.equalTo(backButton.snp.trailing).offset(14.49)
        }
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalToSuperview().offset(20)
        }
        dateLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.top.equalToSuperview().offset(222)
        }
        timeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(36)
            $0.top.equalTo(dateLabel.snp.bottom).offset(13)
        }
        guideLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(40)
            $0.bottom.equalTo(datePicker.snp.top).offset(-21)
        }
        datePicker.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(confirmButton.snp.top)
            $0.width.equalToSuperview()
            $0.height.equalTo(215)
        }
        confirmButton.snp.makeConstraints {
            $0.bottom.equalTo(view).offset(-44)
            $0.height.equalTo(44)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}

