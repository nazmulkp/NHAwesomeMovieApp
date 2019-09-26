//
//  MovieDetailsTableViewCell.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import UIKit


class MovieDetailsTableViewCell : MovieTableViewCell{
    
    
    override var viewModel: MovieTCVM? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        if let vm = viewModel {
            labelRating.text = vm.ratingVM
            labelTitle.text = vm.titleVM
            labelOverview.text = vm.overviewVM
            labelReleaseDate.text = vm.releseDateVM
            let url = URL(string: K.PosterImageDownload.endpath(withName: vm.posterviewVM).path)
            imageViewForPreview.kf.setImage(with: url)
        }
    }
    
    
    var labelOverview: UILabel = {
        var label = UILabel()
        label.text = "For the past two weeks, Mohamad Shafi has been at the bedside of his 13-year-old son Rafi, who has been admitted to the nephrology ward of a state-run hospital in Indian-administered Kashmir's main city of Srinagar."
        label.textColor = UIColor.gray
        label.numberOfLines = 6
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupCell()  {
        addSubview(imageViewForPreview)
        imageViewForPreview.addSubview(blackShadowView)
        blackShadowView.fillSuperview()
        addSubview(labelTitle)
        addSubview(labelRating)
        addSubview(labelOverview)
        addSubview(labelReleaseDate)
        imageViewForPreview.anchor(self.topAnchor, left: self.leftAnchor, bottom: labelRating.topAnchor, right: self.rightAnchor,topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 340)
        
        labelRating.anchor(imageViewForPreview.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor,topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        labelTitle.anchor(labelRating.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 3, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        
        labelOverview.numberOfLines = 0
        labelOverview.anchor(labelTitle.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor,topConstant: 5 , leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        labelReleaseDate.anchor(labelOverview.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 10, leftConstant: 15, bottomConstant: 15, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
    }
    
}

