//
//  LeagueView.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class LeagueView: BaseView {
    let mainCell = UIView()
    
    let textCell = UIView()
    
    let leagueImage = UIImageView()
    let countryName = UILabel()
    let leagueName = UILabel()
    let arrowImage = UIImageView()
    
    
    override func addViews(){
        
        addSubview(mainCell)
        
        mainCell.addSubview(leagueImage)
        mainCell.addSubview(textCell)
        
        textCell.addSubview(countryName)
        textCell.addSubview(arrowImage)
        textCell.addSubview(leagueName)
        
    }
    
    override func styleViews(){
        mainCell.backgroundColor = .white
        textCell.backgroundColor = .white
        
        countryName.font = UIFont(name: "Roboto-Bold", size: 14)
        countryName.textColor = .black
        countryName.numberOfLines = 1
        
        leagueName.font = UIFont(name: "Roboto-Bold", size: 14)
        leagueName.textColor = .gray
        leagueName.numberOfLines = 1
        
        arrowImage.image = UIImage(named: "ic_pointer_right")
        
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(56)
        }
        
        leagueImage.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(32)
            make.width.equalTo(32)
        }
        
        textCell.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(24)
        }
        
        countryName.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(countryName.snp.trailing)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        leagueName.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(arrowImage.snp.trailing)
            make.height.equalTo(16)
            make.width.equalTo(91)
        }
    }
    
    func leagueInfo(with league: League){
        leagueImage.image = league.logo
        countryName.text = league.country
        leagueName.text = league.name
    }
}
