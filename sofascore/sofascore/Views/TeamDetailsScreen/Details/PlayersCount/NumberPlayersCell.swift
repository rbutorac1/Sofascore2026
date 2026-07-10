//
//  NumberPlayersCell.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import UIKit
import SnapKit

class NumberPlayersCell: UITableViewCell {
    
    let number: NumberPlayersStackView = NumberPlayersStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(number)
    }
    
    func setupConstraints(){
        number.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
