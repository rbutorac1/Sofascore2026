//
//  SportView.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SportView: BaseView {
        
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
    
    enum Measures {
        
        static let iconOffset = 4
        static let textOffset = 8
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        iconCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.iconOffset)
            make.centerX.equalToSuperview()
        }
        
        sportNameCell.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().inset(Measures.textOffset)
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

protocol SportViewDelegate: AnyObject {
    func didClickSportView(_ view: SportView)
}
