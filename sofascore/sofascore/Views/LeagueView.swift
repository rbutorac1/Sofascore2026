//
//  LeagueView.swift
//  sofascore
//
//  Created by akademija on 15.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

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
        
        countryName.font = Fonts.RobotoBoldTitle
        countryName.textColor = .black
        countryName.numberOfLines = 1
        
        leagueName.font = Fonts.RobotoBoldTitle
        leagueName.textColor = .gray
        leagueName.numberOfLines = 1
        
        arrowImage.image = Images.pointerRight
        
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
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
        leagueImage.sd_setImage(with: URL(string: league.logoUrl!))
        countryName.text = league.country!.name
        leagueName.text = league.name
    }
}
