//
//  sectionDividerView.swift
//  sofascore
//
//  Created by akademija on 21.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class SectionDividerView: BaseView {
    
    let mainCell: UIView = UIView()
    let line: UIImageView = UIImageView()
    
    override func addViews(){
        addSubview(mainCell)
        
        mainCell.addSubview(line)
    }
    
    override func styleViews(){
        mainCell.backgroundColor = Colors.defaultBackgroundColor
        
        line.image = Images.sectionDivider
    }
    
    enum Measures {
        
        static let dividerHeight = 8
        static let lineHeight = 1
    }
    
    override func setupConstraints(){
        mainCell.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            make.height.equalTo(Measures.dividerHeight)
        }
        
        line.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(Measures.lineHeight)
        }
    }
}
