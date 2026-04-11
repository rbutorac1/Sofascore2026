//
//  EventLeagueView.swift
//  sofascore
//
//  Created by akademija on 28.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class EventLeagueView: BaseView {
    
    enum Measures {
        
        static let cellHeight = 48
        static let arrowSize = 24
        static let arrowTopBottom = 12
        static let arrowLeading = 16
        static let textCellTopBottom = 16
        static let textCellArrowDistance = 24
        static let textCellTrailing = 16
        static let logoSize = 16
        static let logoTextDistance = 8
    }
    
    let mainCell: UIView = UIView()
    let arrow: UIImageView = UIImageView()
    let leagueCell: UIView = UIView()
    let leagueLogo: UIImageView = UIImageView()
    let leagueText: UILabel = UILabel()
    
    var arrowTap: (() -> Void)?
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(arrow)
        mainCell.addSubview(leagueCell)
        leagueCell.addSubview(leagueLogo)
        leagueCell.addSubview(leagueText)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        arrow.image = Images.arrowBack
        
        leagueText.font = Fonts.RobotoCondensedRegularTitle
        leagueText.textColor = Colors.leagueInfoColor
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(Measures.cellHeight)
        }
        
        arrow.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(Measures.arrowLeading)
            make.top.equalToSuperview().offset(Measures.arrowTopBottom)
            make.bottom.equalToSuperview().inset(Measures.arrowTopBottom)
            make.size.equalTo(Measures.arrowSize)
        }
        
        leagueCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.textCellTopBottom)
            make.bottom.equalToSuperview().inset(Measures.textCellTopBottom)
            make.leading.equalTo(arrow.snp.trailing).offset(Measures.textCellArrowDistance)
            make.trailing.equalToSuperview().inset(Measures.textCellTrailing)
        }
        
        leagueLogo.snp.makeConstraints{ make in
            make.leading.top.bottom.equalToSuperview()
            make.size.equalTo(Measures.logoSize)
        }
        
        leagueText.snp.makeConstraints{ make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(leagueLogo.snp.trailing).offset(Measures.logoTextDistance)
        }
    }
    
    func leagueInfo(league: League){
        leagueText.text = (league.country?.name ?? "Unknown country") + ", " + (league.name)
        
        guard let url = league.logoUrl else{
            return
        }
        leagueLogo.sd_setImage(with: URL(string: url))
    }
    
    override func setupGestureRecognizers(){
        let click = UITapGestureRecognizer(target: self, action: #selector(didTapArrow))
        arrow.isUserInteractionEnabled = true
        arrow.addGestureRecognizer(click)
    }
    
    @objc private func didTapArrow(){
        arrowTap?()
    }
}

