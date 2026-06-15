//
//  HeaderSelector.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

import UIKit
import SofaAcademic
import SnapKit

class HeaderSelectorView: BaseView {
    
    enum Measures {
        
        static let viewHeight = 48
        static let labelTop = 16
        static let labelHeight = 16
        static let indicatorHeight = 4
        static let indicatorWidth = 164
    }
    
    let mainView: UIView = UIView()
    let firstTab: UIView = UIView()
    let firstTabLabel: UILabel = UILabel()
    let secondTab: UIView = UIView()
    let secondTabLabel: UILabel = UILabel()
    let indicator: UIImageView = UIImageView()
    
    var indicatorConstraint: Constraint?
    var selected: ((String) -> Void)?
    var isLeague: Bool?
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(firstTab)
        mainView.addSubview(secondTab)
        mainView.addSubview(indicator)
        
        firstTab.addSubview(firstTabLabel)
        secondTab.addSubview(secondTabLabel)
    }
    
    override func styleViews(){
        mainView.backgroundColor = Colors.sofaColor
        indicator.backgroundColor = Colors.defaultBackgroundColor
        
        firstTabLabel.font = Fonts.RobotoRegularTitle14
        firstTabLabel.textColor = .white
        firstTabLabel.textAlignment = .center
        
        secondTabLabel.font = Fonts.RobotoRegularTitle14
        secondTabLabel.textColor = .white
        secondTabLabel.textAlignment = .center
        
        indicator.image = Images.underline
        indicator.layer.cornerRadius = 2
        indicator.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        
        indicator.clipsToBounds = true
    }

    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.viewHeight)
        }
        
        firstTab.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        secondTab.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(firstTab.snp.trailing)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        
        firstTabLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.labelHeight)
        }
        
        secondTabLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.labelHeight)
        }
        
        indicator.snp.makeConstraints{ make in
            make.bottom.equalTo(mainView.snp.bottom)
            make.height.equalTo(Measures.indicatorHeight)
            make.width.equalTo(Measures.indicatorWidth)
            
            indicatorConstraint = make.centerX.equalTo(firstTab.snp.centerX).constraint
        }
    }
    
    override func setupGestureRecognizers(){
        let firstTabClick = UITapGestureRecognizer(target: self, action: #selector(handleFirstTab))
        firstTab.addGestureRecognizer(firstTabClick)
        
        let secondTabClick = UITapGestureRecognizer(target: self, action: #selector(handleSecondTab))
        secondTab.addGestureRecognizer(secondTabClick)
    }
    
    @objc private func handleFirstTab(){
        moveIndicator(to: firstTab)
        
        guard let isLeague = self.isLeague else {
            return
        }
        if(isLeague){
            selected?("matches")
        } else {
            selected?("details")
        }
    }
    
    @objc private func handleSecondTab(){
        moveIndicator(to: secondTab)
        
        guard let isLeague = self.isLeague else {
            return
        }
        if(isLeague){
            selected?("standings")
        } else {
            selected?("squad")
        }
    }
    
    func moveIndicator(to view: UIView){
        indicator.snp.remakeConstraints{ make in
            make.bottom.equalTo(mainView.snp.bottom)
            make.height.equalTo(Measures.indicatorHeight)
            make.width.equalTo(Measures.indicatorWidth)
            
            indicatorConstraint = make.centerX.equalTo(view.snp.centerX).constraint
        }
        
        UIView.animate(withDuration: 0.3){
            self.layoutIfNeeded()
        }
    }
    
    func leagueOrTeamSelector(isLeague: Bool){
        self.isLeague = isLeague
        
        if(isLeague){
            firstTabLabel.text = "Matches"
            secondTabLabel.text = "Standings"
        } else {
            firstTabLabel.text = "Details"
            secondTabLabel.text = "Squad"
        }
    }
}
