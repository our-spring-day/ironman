//
//  PenaltyTableViewCell.swift
//  ironman
//
//  Created by 정재인 on 2021/05/28.
//

import UIKit

class PenaltyTableViewCell: UITableViewCell {
    static let id = "PenaltyTableViewCell"
    let button = BaseGrayButton(icon: "", text: "")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(penalty: tempPenalty) {
        button.iconLabel.text = penalty.icon
        button.textLabel.text = penalty.text
    }
}

// MARK: attribute & layout

extension PenaltyTableViewCell {
    func attribute() {}
    func layout() {
        [button].forEach {addSubview($0)}
        
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
    }
}
