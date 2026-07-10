//
//  VenueView.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import SnapKit
import SofaAcademic
import UIKit

class VenueView: BaseView {
    
    enum Measures {
        
        static let labelTop = 8
        static let labelHorizontal = 16
        static let labelHeight = 16
        static let labelWidth = 160
    }
    
    let mainView: UIView = UIView()
    let venueName: UILabel = UILabel()
    let stadiumLabel: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(venueName)
        mainView.addSubview(stadiumLabel)
    }
    
    override func styleViews(){
        mainView.backgroundColor = Colors.defaultBackgroundColor
        
        venueName.font = Fonts.RobotoRegularTitle14
        venueName.textAlignment = .right
        stadiumLabel.font = Fonts.RobotoRegularTitle14
        stadiumLabel.text = "Stadium"
    }
    
    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        stadiumLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.leading.equalToSuperview().offset(Measures.labelHorizontal)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
        
        venueName.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.labelTop)
            make.trailing.equalToSuperview().inset(Measures.labelHorizontal)
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
    }
    
    func venueInfo(venue: TeamVenue){
        venueName.text = venue.name
    }
}
