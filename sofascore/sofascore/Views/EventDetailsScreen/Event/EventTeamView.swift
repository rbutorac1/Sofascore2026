//
//  EventTeamView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class EventTeamView: BaseView {
    
    enum Measures {
        
        static let cellWidth = 96
        static let cellHeight = 80
        static let logoSize = 40
        static let logoLeadingTrailing = 28
        static let logoTextDistance = 8
    }
    
    let mainCell: UIView = UIView()
    let teamLogo: UIImageView = UIImageView()
    let teamName: UILabel = UILabel()
    
    var team: Team?
    var click: ((Team) -> Void)?
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(teamLogo)
        mainCell.addSubview(teamName)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        teamName.font = Fonts.RobotoBoldTitle12
        teamName.numberOfLines = 2
        teamName.textAlignment = .center
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()            
        }
        
        teamLogo.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(Measures.logoSize)
        }
        
        teamName.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(teamLogo.snp.bottom).offset(Measures.logoTextDistance)
        }
    }
    
    override func setupGestureRecognizers(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleClick))
        mainCell.isUserInteractionEnabled = true
        mainCell.addGestureRecognizer(tap)
    }
    
    func teamInfo(team: Team){
        teamName.text = team.name
        self.team = team
        
        teamLogo.sd_setImage(with: URL(string: team.logoUrl))
    }
    
    @objc func handleClick(){
        if let team = self.team {
            click?(team)
        }
    }
}
