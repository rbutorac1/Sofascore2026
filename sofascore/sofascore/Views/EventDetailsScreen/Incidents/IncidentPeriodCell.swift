//
//  IncidentPeriodCell.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

import UIKit
import SnapKit

class IncidentPeriodCell: UITableViewCell {
    
    let period: IncidentPeriodView = IncidentPeriodView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(period)
    }
    
    func setupConstraints(){
        period.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
