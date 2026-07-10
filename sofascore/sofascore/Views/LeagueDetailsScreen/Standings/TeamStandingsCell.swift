//
//  TeamStandingsCell.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import UIKit
import SnapKit

class TeamStandingsCell: UITableViewCell {
    
    let standings: TeamStandingsView = TeamStandingsView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(standings)
    }
    
    func setupConstraints(){
        standings.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
