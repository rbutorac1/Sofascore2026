//
//  TournamentCollectionView.swift
//  sofascore
//
//  Created by akademija on 04.06.2026..
//

import SnapKit
import UIKit
import SofaAcademic

class TournamentCollectionView: BaseView {
    
    enum Measures {
        
        static let itemsPerRow: CGFloat = 3
        static let itemHeight: CGFloat = 96
    }
    
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var tournaments: [League] = []
    
    override init(){
        super.init()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TournamentCollectionViewCell.self, forCellWithReuseIdentifier: "TournamentCollectionViewCell")
    }
    
    override func addViews(){
        addSubview(collectionView)
    }
    
    override func styleViews(){
        collectionView.backgroundColor = Colors.defaultBackgroundColor
        collectionView.isScrollEnabled = false
    }
    
    override func setupConstraints(){
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCollection(with tournaments: [League]){
        self.tournaments = tournaments
        collectionView.reloadData()
    }
    
    static func height(for tournamentsCount: Int) -> CGFloat {
        if(tournamentsCount == 0){
            return 0
        }
        
        let rows = ceil(CGFloat(tournamentsCount) / Measures.itemsPerRow)
        let collectionHeight = rows * Measures.itemHeight
        
        return collectionHeight
    }
}

extension TournamentCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tournaments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TournamentCollectionViewCell", for: indexPath) as? TournamentCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let tournament = tournaments[indexPath.item]
        cell.tournamentView.tournamentInfo(tournament: tournament)
        
        return cell
    }
}

extension TournamentCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / Measures.itemsPerRow
        
        return CGSize(
            width: itemWidth,
            height: Measures.itemHeight
        )
    }
}
