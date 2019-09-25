//
//  TableViewBaseCell.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//



import UIKit


class TableViewBaseCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
    }
}

class NowPlayingTableViewCell : TableViewBaseCell{
    override func setupCell() {
        
    }
    
    func configure(with nowPlaying: NowPlaying?) {
        print(nowPlaying?.title)
    }
}
