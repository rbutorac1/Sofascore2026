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
    
    let mainCell: UIView = UIView()
    let textCell: UIView = UIView()
    let leagueImage: UIImageView = UIImageView()
    let countryName: UILabel = UILabel()
    let leagueName: UILabel = UILabel()
    let arrowImage: UIImageView = UIImageView()
    
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
    
    enum Measures {
        
        static let leageCellHeight = 56
        static let leadingOffset = 16
        static let imagedWidthHeight = 32
        static let imageTextSpacing = 32
        static let textCellHeight = 24
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.leageCellHeight)
        }
        
        leagueImage.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Measures.leadingOffset)
            make.height.equalTo(Measures.imagedWidthHeight)
            make.width.equalTo(Measures.imagedWidthHeight)
        }
        
        textCell.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(leagueImage.snp.trailing).offset(Measures.imageTextSpacing)
            make.height.equalTo(Measures.textCellHeight)
        }
        
        countryName.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(countryName.snp.trailing)
            make.height.equalToSuperview()
        }
        
        leagueName.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(arrowImage.snp.trailing)
        }
    }
    
    func leagueInfo(with league: League){
        leagueImage.sd_setImage(with: URL(string: league.logoUrl!))
        countryName.text = league.country!.name
        leagueName.text = league.name
    }
}
