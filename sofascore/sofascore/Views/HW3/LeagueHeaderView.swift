//
//  LeagueHeaderView.swift
//  sofascore
//
//  Created by akademija on 27.03.2026..
//

import UIKit
import SofaAcademic
import SnapKit

class LeagueHeaderView: UITableViewHeaderFooterView {
    
    let leagueView: LeagueView = LeagueView()
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(leagueView)
    }
    
    func setupConstraints(){
        leagueView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

