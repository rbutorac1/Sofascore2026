//
//  NumberPlayersView.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class NumberPlayersView: BaseView {
    
    enum Measures {
        
        static let iconSize = 40
        static let topOffset = 8
        static let numberHeight = 16
        static let descHeight = 32
        static let descWidth = 156
    }
    
    let mainView: UIView = UIView()
    let icon: UIImageView = UIImageView()
    let numberLabel: UILabel = UILabel()
    let descLabel: UILabel = UILabel()
    
    override func addViews(){
        addSubview(mainView)
        
        mainView.addSubview(icon)
        mainView.addSubview(numberLabel)
        mainView.addSubview(descLabel)
    }
    
    override func styleViews(){
        mainView.backgroundColor = Colors.defaultBackgroundColor
                
        numberLabel.font = Fonts.RobotoBoldTitle16
        numberLabel.textColor = Colors.sofaColor
        numberLabel.textAlignment = .center
        
        descLabel.font = Fonts.RobotoCondensedRegularTitle12
        descLabel.textColor = Colors.standingsHeader
        descLabel.textAlignment = .center
    }
    
    override func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        icon.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.topOffset)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(Measures.iconSize)
        }
        
        numberLabel.snp.makeConstraints{ make in
            make.top.equalTo(icon.snp.bottom).offset(Measures.topOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.numberHeight)
            make.width.equalTo(Measures.iconSize)
        }
        
        descLabel.snp.makeConstraints{ make in
            make.top.equalTo(numberLabel.snp.bottom).offset(Measures.topOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Measures.descHeight)
            make.width.equalTo(Measures.descWidth)
        }
    }
    
    func configureNumbers(isForeign: Bool, number: Int){
        numberLabel.text = "\(number)"
        if(isForeign){
            icon.image = Images.pieChart
            descLabel.text = "Foreign players"
        } else {
            icon.image = Images.playersIcon
            descLabel.text = "Total Players"
        }
    }
}
