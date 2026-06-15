//
//  HeaderDetailsView.swift
//  sofascore
//
//  Created by akademija on 01.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic
import SDWebImage

class HeaderDetailsView: BaseView {
    
    enum Measures {
        
        static let arrowViewSize = 48
        static let arrowOffset = 4
        static let arrowIconSize = 24
        static let logoViewSize = 56
        static let logoOffset = 16
        static let logoRadius = 8
        static let logoSize = 40
        static let nameHeight = 28
        static let nameLeading = 16
        static let nameTop = 52
        static let countryCellHeight = 16
        static let collapsedTop = 10
    }
    
    let mainView: UIView = UIView()
    let arrowView: UIView = UIView()
    let arrowIcon: UIImageView = UIImageView()
    let logoView: UIView = UIView()
    let logoImage: UIImageView = UIImageView()
    let nameLabel: UILabel = UILabel()
    let countryView: UIView = UIView()
    let flag: UIImageView = UIImageView()
    let countryName: UILabel = UILabel()
    
    var leagueNameTopConstraint: Constraint?
    var arrowTap: (() -> Void)?
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(arrowView)
        mainView.addSubview(logoView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(countryView)
        
        arrowView.addSubview(arrowIcon)
        logoView.addSubview(logoImage)
        countryView.addSubview(flag)
        countryView.addSubview(countryName)
    }
    
    override func styleViews(){
        mainView.backgroundColor = Colors.sofaColor
        mainView.clipsToBounds = true
        
        logoView.backgroundColor = Colors.defaultBackgroundColor
        logoView.layer.cornerRadius = CGFloat(Measures.logoRadius)
        
        arrowIcon.image = Images.arrowBackWhite
        arrowIcon.contentMode = .scaleAspectFit
        
        nameLabel.textColor = .white
        nameLabel.font = Fonts.RobotoBoldTitle20
        
        countryName.textColor = .white
        countryName.font = Fonts.RobotoBoldTitle14
        
        flag.layer.cornerRadius = CGFloat(Measures.countryCellHeight / 2)
        flag.layer.borderWidth = 1
        flag.layer.borderColor = Colors.imageBorder
        flag.clipsToBounds = true
    }
    
    override func setupGestureRecognizers(){
        let click = UITapGestureRecognizer(target: self, action: #selector(didTapArrow))
        arrowIcon.isUserInteractionEnabled = true
        arrowIcon.addGestureRecognizer(click)
    }
    
    @objc private func didTapArrow(){
        arrowTap?()
    }
    
    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        arrowView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalTo(Measures.arrowOffset)
            make.width.height.equalTo(Measures.arrowViewSize)
        }
        
        arrowIcon.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(Measures.arrowIconSize)
        }
        
        logoView.snp.makeConstraints{ make in
            make.top.equalTo(arrowView.snp.bottom)
            make.width.height.equalTo(Measures.logoViewSize)
            make.leading.equalToSuperview().offset(Measures.logoOffset)
        }
        
        logoImage.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(Measures.logoSize)
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.leading.equalTo(logoView.snp.trailing).offset(Measures.nameLeading)
            make.height.equalTo(Measures.nameHeight)
            
            leagueNameTopConstraint = make.top.equalToSuperview().offset(Measures.nameTop).constraint
        }
        
        countryView.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(nameLabel.snp.leading)
            make.height.equalTo(Measures.countryCellHeight)
        }
        
        flag.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(Measures.countryCellHeight)
        }
        
        countryName.snp.makeConstraints{ make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(flag.snp.trailing)
        }
    }
    
    func collapsedProgress(_ progress: CGFloat){
        logoView.alpha = 1 - progress
        countryView.alpha = 1 - progress
        
        let new = CGFloat(Measures.nameTop) - ((CGFloat(Measures.nameTop) - CGFloat(Measures.collapsedTop)) * progress)
        
        leagueNameTopConstraint?.update(offset: new)
    }
    
    func leagueInfo(league: League){
        nameLabel.text = league.name
        logoImage.sd_setImage(with: URL(string: league.logoUrl))
        setupCountry(country: league.country)
    }
    
    func teamInfo(team: Team){
        nameLabel.text = team.name
        logoImage.sd_setImage(with: URL(string: team.logoUrl))
        setupCountry(country: team.country)
    }
    
    func setupCountry(country: Country?){
        if let country = country?.name {
            countryName.text = " \(country)"
        }
        if let url = CountryCodes.flagUrl(countryName: country?.name){
            flag.sd_setImage(with: URL(string: url))
        }
    }
}
