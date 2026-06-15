//
//  LeagueRoundView.swift
//  sofascore
//
//  Created by akademija on 02.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class PlayerRoundTableHeader: UITableViewHeaderFooterView {
    
    enum Measures {
        
        static let textHeight = 16
        static let textTop = 24
        static let textLeading = 16
    }
    
    let mainCell: UIView = UIView()
    let title: UILabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addViews()
        styleViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        addSubview(mainCell)
        mainCell.addSubview(title)
    }
    
    func styleViews(){
        contentView.backgroundColor = Colors.eventBackground
        
        title.font = Fonts.RobotoBoldTitle12
    }
    
    func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Measures.textTop)
            make.leading.equalToSuperview().offset(Measures.textLeading)
            make.height.equalTo(Measures.textHeight)
        }
    }
    
    func roundNumber(number: Int){
        title.text = "Round \(number)"
    }
    
    func players(){
        title.text = "Players"
    }
}
