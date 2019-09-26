//
//  TableViewBaseCell.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//



import UIKit
import Kingfisher


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


protocol MovieTCVM {
    var articleVM: Movie { get }
    var ratingVM: String { get }
    var titleVM: String { get }
    var overviewVM: String { get }
    var releseDateVM: String { get }
    var smallpreviewVM: String { get }
    var posterviewVM: String { get }
}

extension Movie: MovieTCVM {

    var titleVM: String {
        return title ?? ""
    }
    
    var ratingVM: String {
        return "Rating: " + "\(voteAverage ?? 0.0)"
    }
    var overviewVM: String {
        return overview ?? ""
    }
    
    var releseDateVM: String {
        return "Release date: " + "\(releaseDate ?? "")"
    }
    
    var smallpreviewVM: String {
        return backdropPath ?? ""
    }
    
    var posterviewVM: String {
        return posterPath ?? ""
    }
    
    
    var articleVM: Movie {
        return self
    }
    
}

class MovieTableViewCell : TableViewBaseCell{
    
    
    var viewModel: MovieTCVM? {
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
            let url = URL(string: K.SmallImageDownload.endpath(withName: vm.smallpreviewVM).path)
           // print(url)
            imageViewForPreview.kf.setImage(with: url)
        }
    }
    
    
    var imageViewForPreview : UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "aaaaa")
        return  imageView
    }()
    
    var blackShadowView : UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()
    
    var labelRating: UILabel = {
        var label = UILabel()
        label.text = "#6.5"
        label.textColor = UIColor.init(rgb: 0xFD5A00)
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "It Chapter Two"
        label.textColor = UIColor.black
        label.numberOfLines = 0
        
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelOverview: UILabel = {
        var label = UILabel()
        label.text = "For the past two weeks, Mohamad Shafi has been at the bedside of his 13-year-old son Rafi, who has been admitted to the nephrology ward of a state-run hospital in Indian-administered Kashmir's main city of Srinagar."
        label.textColor = UIColor.gray
        label.numberOfLines = 6
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelReleaseDate: UILabel = {
        var label = UILabel()
        label.text = "release_date"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    var horizontalLine : UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.gray
        return view
        
    }()
    
    
    override func setupCell()  {
        addSubview(imageViewForPreview)
        imageViewForPreview.addSubview(blackShadowView)
        blackShadowView.fillSuperview()
        addSubview(labelTitle)
        addSubview(labelRating)
        addSubview(labelOverview)
        addSubview(labelReleaseDate)
        imageViewForPreview.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 5, widthConstant: self.frame.width/2, heightConstant: self.frame.width/2)
        
        labelRating.anchor(self.topAnchor, left: imageViewForPreview.rightAnchor, bottom: nil, right: self.rightAnchor,
                            topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        labelTitle.anchor(labelRating.bottomAnchor, left: imageViewForPreview.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 3, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        
        
        labelOverview.anchor(labelTitle.bottomAnchor, left: labelRating.leftAnchor, bottom: nil, right: self.rightAnchor,
                                    topConstant: 5 , leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        labelReleaseDate.anchor(nil, left: labelRating.leftAnchor, bottom: self.bottomAnchor, right: nil,
                                   topConstant: 0, leftConstant: 0, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 16)
        
        addSubview(horizontalLine)
        horizontalLine.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
    }

}



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

