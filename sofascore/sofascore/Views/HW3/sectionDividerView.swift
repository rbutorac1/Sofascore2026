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
    
    enum Measures {
        
        static let lineHeight = 1
    }
    
    let line: UIImageView = UIImageView()
    
    override func addViews(){
        addSubview(line)
    }
    
    override func styleViews(){
        line.image = Images.sectionDivider
    }
    
    override func setupConstraints(){
        line.snp.makeConstraints{ make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(Measures.lineHeight)
        }
    }
}
