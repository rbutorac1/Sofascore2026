//
//  PersonView.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic
import SDWebImage

class PersonView: BaseView {
    
    enum Measures {
        
        static let imageTopOffset = 8
        static let detailsTopOffset = 10
        static let leadingOffset = 16
        static let detailsViewHeight = 36
        static let detailsWidth = 272
        static let labelHeight = 16
        static let imageSize = 40
        static let flagSize = 16
        static let underlineHeight = 8
    }
    
    let mainView: UIView = UIView()
    let imageView: UIImageView = UIImageView()
    let detailsView: UIView = UIView()
    let personName: UILabel = UILabel()
    let countryName: UILabel = UILabel()
    let flag: UIImageView = UIImageView()
    let underline: SectionDividerView = SectionDividerView()
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(underline)
        mainView.addSubview(imageView)
        mainView.addSubview(detailsView)
        
        detailsView.addSubview(personName)
        detailsView.addSubview(flag)
        detailsView.addSubview(countryName)
    }
    
    override func styleViews(){
        mainView.backgroundColor = Colors.defaultBackgroundColor

        imageView.layer.cornerRadius = CGFloat(Measures.imageSize / 2)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = Colors.imageBorder
        imageView.clipsToBounds = true
        
        personName.font = Fonts.RobotoRegularTitle14
        
        countryName.font = Fonts.RobotoBoldTitle12
        countryName.textColor = Colors.standingsHeader
        
        flag.layer.cornerRadius = CGFloat(Measures.flagSize / 2)
        flag.layer.borderWidth = 1
        flag.layer.borderColor = Colors.imageBorder
        flag.clipsToBounds = true
    }
    
    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(mainView.snp.top).offset(Measures.imageTopOffset)
            make.leading.equalToSuperview().offset(Measures.leadingOffset)
            make.height.width.equalTo(Measures.imageSize)
        }
        
        detailsView.snp.makeConstraints{ make in
            make.top.equalTo(mainView.snp.top).offset(Measures.detailsTopOffset)
            make.leading.equalTo(imageView.snp.trailing).offset(Measures.leadingOffset)
            make.width.equalTo(Measures.detailsWidth)
            make.height.equalTo(Measures.detailsViewHeight)
        }
        
        personName.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.labelHeight)
        }
        
        flag.snp.makeConstraints{ make in
            make.bottom.leading.equalToSuperview()
            make.height.width.equalTo(Measures.flagSize)
        }
        
        countryName.snp.makeConstraints{ make in
            make.bottom.trailing.equalToSuperview()
            make.leading.equalTo(flag.snp.trailing)
            make.height.equalTo(Measures.labelHeight)
        }
        
        underline.snp.makeConstraints{ make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.underlineHeight)
        }
    }
    
    func coachInfo(coach: TeamManager){
        imageView.sd_setImage(with: URL(string: coach.imageUrl))
        personName.text = "Coach: \(coach.name)"
        setupCountry(country: coach.country)
    }
    
    func playerInfo(player: Player){
        imageView.sd_setImage(with: URL(string: player.imageUrl))
        personName.text = player.name
        setupCountry(country: player.country)
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
