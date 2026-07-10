//
//  TournamentTableViewCell.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import UIKit
import SnapKit

class TournamentTableViewCell: UITableViewCell {
    
    let collection: TournamentCollectionView = TournamentCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(collection)
    }
    
    func setupConstraints(){
        collection.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    static func getHeight(tournaments: [League]) -> CGFloat {
        let height = TournamentCollectionView.height(for: tournaments.count)
        return CGFloat(height)
    }
}
