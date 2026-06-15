//
//  VenueCell.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import UIKit
import SnapKit

class VenueCell: UITableViewCell {
    
    let venue: VenueView = VenueView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(venue)
    }
    
    func setupConstraints(){
        venue.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}
