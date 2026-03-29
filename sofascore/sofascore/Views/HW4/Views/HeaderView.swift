//
//  HeaderView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class HeaderView: BaseView{
    
    enum Measures {
        
        static let headerHeight = 48
        static let settingsAreaInset = 4
        static let settingsAreaWidth = 48
        static let trophyAreaWidth = 48
        static let settingsIconSize = 24
        static let trophyIconSize = 24
        static let sofascoreTopBottom = 14
        static let sofascoreLeading = 16
        static let sofascoreWidth = 132
        static let sofascoreHeight = 20
    }
    
    let mainCell: UIView = UIView()
    let settingsArea: UIView = UIView()
    let settingsIcon: UIImageView = UIImageView()
    let trophyArea: UIView = UIView()
    let trophyIcon: UIImageView = UIImageView()
    let sofascore: UIImageView = UIImageView()
    
    var settingsTap: (() -> Void)?
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(settingsArea)
        mainCell.addSubview(sofascore)
        mainCell.addSubview(trophyArea)
        settingsArea.addSubview(settingsIcon)
        trophyArea.addSubview(trophyIcon)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.sportSelectorBackgroundColor
        
        settingsIcon.image = Images.settingsIcon
        trophyIcon.image = Images.trophyIcon
        sofascore.image = Images.sofa
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(Measures.headerHeight)
        }
        
        sofascore.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.sofascoreTopBottom)
            make.bottom.equalToSuperview().inset(Measures.sofascoreTopBottom)
            make.leading.equalToSuperview().offset(Measures.sofascoreLeading)
            make.width.equalTo(Measures.sofascoreWidth)
            make.height.equalTo(Measures.sofascoreHeight)
        }
        
        settingsArea.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(Measures.settingsAreaInset)
            make.width.equalTo(Measures.settingsAreaWidth)
        }
        
        trophyArea.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalTo(settingsArea.snp.leading)
            make.width.equalTo(Measures.trophyAreaWidth)
        }
        
        settingsIcon.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(Measures.settingsIconSize)
        }
        
        trophyIcon.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(Measures.trophyIconSize)
        }
    }
    
    override func setupGestureRecognizers() {
        let click = UITapGestureRecognizer(target: self, action: #selector(didTapSettings))
        settingsArea.addGestureRecognizer(click)
    }
    
    @objc private func didTapSettings(){
        settingsTap?()
    }
}
