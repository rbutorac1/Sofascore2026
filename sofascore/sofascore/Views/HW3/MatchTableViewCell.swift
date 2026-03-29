//
//  MatchTableViewCell.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SnapKit

class MatchTableViewCell: UITableViewCell {
    
    let matchView: MatchView = MatchView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(matchView)
    }
    
    func setupConstraints(){
        matchView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
