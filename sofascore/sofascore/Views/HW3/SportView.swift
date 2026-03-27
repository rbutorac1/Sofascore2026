//
//  SportView.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

protocol SportViewDelegate: AnyObject {
    func didClickSportView(_ view: SportView)
}

class SportView: BaseView {
    
    enum Measures {
        
        static let iconOffset = 4
        static let textOffsetInset = 8
        static let iconSize = 16
        static let iconTextSpacing = 4
    }
        
    let mainCell: UIView = UIView()
    let iconCell: UIImageView = UIImageView()
    let sportNameCell: UILabel = UILabel()
    
    weak var delegate: SportViewDelegate?
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(iconCell)
        mainCell.addSubview(sportNameCell)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.sportSelectorBackgroundColor
        
        sportNameCell.textColor = Colors.sportsNameColor
        sportNameCell.textAlignment = .center
        sportNameCell.font = Fonts.RobotoRegularTitle
    }
    
    override func setupGestureRecognizers() {
        let click = UITapGestureRecognizer(target: self, action: #selector(handleClick))
        addGestureRecognizer(click)
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        iconCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.iconOffset)
            make.centerX.equalToSuperview()
            make.size.equalTo(Measures.iconSize)
        }
        
        sportNameCell.snp.makeConstraints{ make in
            make.top.equalTo(iconCell.snp.bottom).offset(Measures.iconTextSpacing)
            make.bottom.equalToSuperview().inset(Measures.textOffsetInset)
            make.leading.equalToSuperview().offset(Measures.textOffsetInset)
            make.trailing.equalToSuperview().inset(Measures.textOffsetInset)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func handleClick(){
        delegate?.didClickSportView(self)
    }
    
    func sportInfo(name: String, icon: UIImage){
        sportNameCell.text = name
        iconCell.image = icon
    }
}
