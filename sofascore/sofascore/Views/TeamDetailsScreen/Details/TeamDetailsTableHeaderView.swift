//
//  TeamDetailsTableHeadeView.swift
//  sofascore
//
//  Created by akademija on 03.06.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class TeamDetailsTableHeaderView: UITableViewHeaderFooterView {
    
    enum Measures {
        
        static let labelHeight = 20
        static let labelWidth = 296
        static let labelTop = 16
        static let labelLeading = 32
    }
    
    let mainView: UIView = UIView()
    let headerLabel: UILabel = UILabel()
    
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
        addSubview(mainView)
        mainView.addSubview(headerLabel)
    }
    
    func styleViews(){
        mainView.backgroundColor = Colors.defaultBackgroundColor
        
        headerLabel.font = Fonts.RobotoBoldTitle16
        headerLabel.textColor = Colors.teamDetailsHeader
        headerLabel.textAlignment = .center
    }
    
    func setupConstraints(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(Measures.labelWidth)
            make.height.equalTo(Measures.labelHeight)
        }
    }
    
    func configureHeader(section: Section){
        switch section {
        case .teamInfo:
            headerLabel.text = "Team Info"
        case .tournaments:
            headerLabel.text = "Tournaments"
        case .venue:
            headerLabel.text = "Venue"
        }
    }
}
