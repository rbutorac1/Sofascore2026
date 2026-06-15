//
//  TournamentView.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class TournamentView: BaseView {
    
    enum Measures {
        
        static let logoTop = 8
        static let nameTop = 4
        static let logoSize = 40
        static let nameHeight = 32
        static let nameWidth = 96
    }
    
    let mainView: UIView = UIView()
    let tournamentLogo: UIImageView = UIImageView()
    let tournamentName: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(tournamentLogo)
        mainView.addSubview(tournamentName)
    }
    
    override func styleViews(){        
        mainView.backgroundColor = Colors.defaultBackgroundColor
        
        tournamentName.font = Fonts.RobotoCondensedRegularTitle12
        tournamentName.textColor = Colors.standingsHeader
        tournamentName.textAlignment = .center
        tournamentName.numberOfLines = 2
    }
    
    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        tournamentLogo.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.logoTop)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(Measures.logoSize)
        }
        
        tournamentName.snp.makeConstraints{ make in
            make.top.equalTo(tournamentLogo.snp.bottom).offset(Measures.nameTop)
            make.centerX.equalToSuperview()
            make.width.equalTo(Measures.nameWidth)
            make.height.equalTo(Measures.nameHeight)
        }
    }
    
    func reset(){
        tournamentLogo.image = nil
        tournamentName.text = nil
    }
    
    func tournamentInfo(tournament: League){
        tournamentName.text = tournament.name
        tournamentLogo.sd_setImage(with: URL(string: tournament.logoUrl))
    }
}
