//
//  LeagueMatchesCell.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import UIKit
import SnapKit

class LeagueMatchesCell: UITableViewCell {
    
    let match: MatchView = MatchView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(match)
    }
    
    func setupConstraints(){
        match.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
