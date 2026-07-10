//
//  TournamentCollectionViewCell.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import UIKit
import SnapKit

class TournamentCollectionViewCell: UICollectionViewCell {
    
    let tournamentView: TournamentView = TournamentView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) error")
    }
    
    func addViews(){
        contentView.addSubview(tournamentView)
    }
    
    func setupConstraints(){
        tournamentView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        tournamentView.reset()
    }
}
