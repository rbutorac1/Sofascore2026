//
//  settingsHeaderView.swift
//  sofascore
//
//  Created by akademija on 07.04.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SettingsHeaderView: BaseView {
    
    enum Measures {
        
        static let arrowBoxOffset = 4
        static let arrowBoxWidth = 48
        static let arrowSize = 24
        static let textOffset = 20
        static let textTopBottom = 10
        static let textInset = 16
    }
    
    private let mainCell: UIView = UIView()
    private let iconBox: UIView = UIView()
    private let arrowIcon: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    
    var arrowTap: (() -> Void)?
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(iconBox)
        mainCell.addSubview(title)
        
        iconBox.addSubview(arrowIcon)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.sportSelectorBackgroundColor
        
        arrowIcon.image = Images.arrowBackWhite
        arrowIcon.isUserInteractionEnabled = false
        
        title.text = "Settings"
        title.font = Fonts.RobotoBoldTitle20
        title.textColor = Colors.defaultBackgroundColor
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconBox.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(Measures.arrowBoxOffset)
            make.width.equalTo(Measures.arrowBoxWidth)
        }
        
        arrowIcon.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(Measures.arrowSize)
        }
        
        title.snp.makeConstraints{ make in
            make.leading.equalTo(iconBox.snp.trailing).offset(Measures.textOffset)
            make.trailing.equalToSuperview().inset(Measures.textInset)
            make.top.equalToSuperview().offset(Measures.textTopBottom)
            make.bottom.equalToSuperview().inset(Measures.textTopBottom)
        }
    }
    
    override func setupGestureRecognizers(){
        let click = UITapGestureRecognizer(target: self, action: #selector(didTapArrow))
        iconBox.isUserInteractionEnabled = true
        iconBox.addGestureRecognizer(click)
    }
    
    @objc private func didTapArrow(){
        arrowTap?()
    }
}
