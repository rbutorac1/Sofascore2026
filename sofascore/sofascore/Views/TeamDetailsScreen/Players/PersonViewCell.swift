//
//  PersonViewCell.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit

class PersonViewCell: UITableViewCell {
    
    let person: PersonView = PersonView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(person)
    }
    
    func setupConstraints(){
        person.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
