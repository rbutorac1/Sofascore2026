//
//  TimeStatusView.swift
//  sofascore
//
//  Created by akademija on 20.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class TimeStatusView: BaseView {
    
    enum Measures {
        
        static let timeStatusViewWidth = 64
        static let verticalOffset = 10
        static let dividerOffset = 8
        static let leadingTrailingOffset = 4
    }
    
    let timeCell: UIView = UIView()
    let matchStartCell: UILabel = UILabel()
    let minuteCell: UILabel = UILabel()
    let dividerLine: UIImageView = UIImageView()
    
    override func addViews(){
        addSubview(timeCell)
        
        timeCell.addSubview(matchStartCell)
        timeCell.addSubview(minuteCell)
        timeCell.addSubview(dividerLine)
    }
    
    override func styleViews(){
        timeCell.backgroundColor = Colors.defaultBackgroundColor
        
        matchStartCell.font = Fonts.RobotoCondensedRegularTitle
        matchStartCell.textColor = Colors.matchStartColor
        matchStartCell.textAlignment = .center
        
        minuteCell.font = Fonts.RobotoCondensedRegularTitle
        minuteCell.textColor = Colors.notLiveColor
        minuteCell.textAlignment = .center
        
        dividerLine.image = .assetsDrawable
    }
    
    override func setupConstraints(){
        timeCell.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Measures.timeStatusViewWidth)
        }
        
        matchStartCell.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.verticalOffset)
            make.leading.trailing.equalToSuperview().offset(Measures.leadingTrailingOffset)
        }
        
        minuteCell.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-Measures.verticalOffset)
            make.leading.trailing.equalToSuperview().offset(Measures.leadingTrailingOffset)
        }
        
        dividerLine.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.dividerOffset)
            make.bottom.equalToSuperview().offset(-Measures.dividerOffset)
            make.trailing.equalToSuperview()
        }
    }
    
    func timeStatusInfo(startTimestamp: Int, status: EventStatus){
        matchStartCell.text = Helper.matchStart(startTimestamp: startTimestamp)
        minuteCell.text = Helper.minute(startTimestamp: startTimestamp, status: status)
        minuteCell.textColor = Helper.minuteColor(status: status)
    }
}
