//
//  TeamSectionView.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class TeamSectionView: BaseView {
    
    let mainCell: UIView = UIView()
    let homeTeamCell: UIView = UIView()
    let homeTeamName: UILabel = UILabel()
    let homeTeamLogo: UIImageView = UIImageView()
    let awayTeamCell: UIView = UIView()
    let awayTeamName: UILabel = UILabel()
    let awayTeamLogo: UIImageView = UIImageView()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(homeTeamCell)
        mainCell.addSubview(awayTeamCell)
        homeTeamCell.addSubview(homeTeamLogo)
        homeTeamCell.addSubview(homeTeamName)
        awayTeamCell.addSubview(awayTeamLogo)
        awayTeamCell.addSubview(awayTeamName)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        homeTeamName.font = Fonts.RobotoRegularTitle
        homeTeamName.numberOfLines = 1
        awayTeamName.font = Fonts.RobotoRegularTitle
        awayTeamName.numberOfLines = 1
        homeTeamLogo.contentMode = .scaleAspectFit
        awayTeamLogo.contentMode = .scaleAspectFit
    }
    
    enum Measures {
        
        static let verticalOffset = 10
        static let leadingOffset = 16
        static let cellSpacing = 4
        static let logoTextSpacing = 8
        static let logoWidth = 16
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.edges.equalToSuperview()
        }
        
        homeTeamCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.verticalOffset)
            make.leading.equalToSuperview().offset(Measures.leadingOffset)
            make.trailing.equalToSuperview()
        }
        
        awayTeamCell.snp.makeConstraints{ make in
            make.top.equalTo(homeTeamCell.snp.bottom).offset(Measures.cellSpacing)
            make.bottom.equalToSuperview().offset(-Measures.verticalOffset)
            make.leading.equalToSuperview().offset(Measures.leadingOffset)
            make.trailing.equalToSuperview()
        }
        
        homeTeamLogo.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.logoWidth)
        }
        
        homeTeamName.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(homeTeamLogo.snp.trailing).offset(Measures.logoTextSpacing)
        }
        
        awayTeamLogo.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.logoWidth)
        }
        
        awayTeamName.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(awayTeamLogo.snp.trailing).offset(Measures.logoTextSpacing)
        }
    }
    
    func teamsInfo(homeTeam: Team, awayTeam: Team, homeGoals: Int?, awayGoals: Int?, status: EventStatus){
        homeTeamLogo.sd_setImage(with: URL(string: homeTeam.logoUrl!))
        homeTeamName.text = homeTeam.name
        awayTeamLogo.sd_setImage(with: URL(string: awayTeam.logoUrl!))
        awayTeamName.text = awayTeam.name
        (homeTeamName.textColor, awayTeamName.textColor) = teamColor(homeGoals: homeGoals, awayGoals: awayGoals, status: status)
    }
}
