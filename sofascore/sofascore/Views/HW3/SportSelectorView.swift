//
//  SportSelectorView.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SportSelectorView: BaseView {
    
    enum Measures {
        
        static let stackViewHeight = 48
        static let stackViewSpacing = 4
        static let indicatorOffset = 8
        static let indicatorHeight = 4
        static let indicatorWidth = 104
    }
    
    let stackView: UIStackView = UIStackView()
    let indicatorView: UIImageView = UIImageView()
    
    let football: SportView = SportView()
    let basketball: SportView = SportView()
    let amFootball: SportView = SportView()
    
    var indicatorLeadingConstraint: Constraint?
    
    override func addViews(){
        addSubview(stackView)
        addSubview(indicatorView)

        stackView.addArrangedSubview(football)
        stackView.addArrangedSubview(basketball)
        stackView.addArrangedSubview(amFootball)
    }
        
    override func styleViews(){
        stackView.backgroundColor = Colors.sportSelectorBackgroundColor
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = CGFloat(Measures.stackViewSpacing)
        stackView.alignment = .fill
        
        indicatorView.image = Images.underline
        indicatorView.layer.cornerRadius = 2
        indicatorView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        
        indicatorView.clipsToBounds = true
        
        addSports()
    }
    
    override func setupConstraints(){
        stackView.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.stackViewHeight)
        }
        
        indicatorView.snp.makeConstraints{ make in
            make.bottom.equalTo(stackView.snp.bottom)
            make.height.equalTo(Measures.indicatorHeight)
            make.width.equalTo(Measures.indicatorWidth)
            
            indicatorLeadingConstraint = make.centerX.equalTo(football.snp.centerX).constraint
        }
    }
    
    func addSports(){
        football.sportInfo(name: "Football", icon: Images.footballIcon)
        football.delegate = self
        basketball.sportInfo(name: "Basketball", icon: Images.basketballIcon)
        basketball.delegate = self
        amFootball.sportInfo(name: "Am. Football", icon: Images.amFootballIcon)
        amFootball.delegate = self
    }
    
    func moveIndicator(to view: UIView){
        indicatorLeadingConstraint?.deactivate()
        
        indicatorView.snp.makeConstraints{ make in
            indicatorLeadingConstraint = make.centerX.equalTo(view.snp.centerX).constraint
        }
        
        UIView.animate(withDuration: 0.3){
            self.layoutIfNeeded()
        }
    }
}

extension SportSelectorView: SportViewDelegate {
    func didClickSportView(_ view: SportView) {
        moveIndicator(to: view)
    }
}
