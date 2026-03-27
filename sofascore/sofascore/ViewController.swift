//
//  ViewController.swift
//  sofascore
//
//  Created by akademija on 06.03.2026..
//

import UIKit
import SnapKit
import SofaAcademic

class ViewController: UIViewController {
    
    enum Measures {
        
        static let selectorHeight = 48
    }
    
    let selectorView: SportSelectorView = SportSelectorView()
    let tableView: MatchTableView = MatchTableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                    
        addViews()
        styleViews()
        setupConstraints()
    }
    
    func addViews(){
        view.addSubview(selectorView)
        view.addSubview(tableView)
    }
    

    func styleViews(){
        view.backgroundColor = Colors.sportSelectorBackgroundColor
    }
    
    func setupConstraints(){
        selectorView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Measures.selectorHeight)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(selectorView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

