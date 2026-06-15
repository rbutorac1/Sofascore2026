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
    var click: (() -> Void)?
    
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        setupConstraints()
        setupGestureRecognizers()
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
    
    func setupGestureRecognizers(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(gesture)
    }
    
    @objc private func handleTap(){
        click?()
    }
}
