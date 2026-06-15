//
//  NumberPlayersStackView.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class NumberPlayersStackView: BaseView {
    
    let stack: UIStackView = UIStackView()
    let totalPlayers: NumberPlayersView = NumberPlayersView()
    let foreignPlayers: NumberPlayersView = NumberPlayersView()
    
    override func addViews(){
        addSubview(stack)
        
        stack.addArrangedSubview(totalPlayers)
        stack.addArrangedSubview(foreignPlayers)
    }
    
    override func styleViews(){
        stack.axis = .horizontal
        stack.distribution = .fillEqually
    }
    
    override func setupConstraints(){
        stack.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
