//
//  DatePickViewController.swift
//  ironman
//
//  Created by 정재인 on 2021/05/27.
//

import UIKit

class DatePickViewController: UIViewController {
    let datePicker = UIDatePicker()
    
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
        self.navigationController?.navigationBar.isHidden = false
        view.do {
            $0.backgroundColor = .white
        }
        datePicker.do {
            $0.preferredDatePickerStyle = .wheels
            $0.datePickerMode = .dateAndTime
            $0.locale = Locale(identifier: "ko-KR")
            $0.timeZone = .autoupdatingCurrent
            $0.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        }
    }
    
    func layout() {
        [datePicker].forEach { view.addSubview($0) }
        
        datePicker.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(300)
        }
    }
}

