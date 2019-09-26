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
            labelReleaseDate.text = vm.releseDateVM
            let url = URL(string: K.SmallImageDownload.endpath(withName: vm.smallpreviewVM).path)
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
        addSubview(labelReleaseDate)
        imageViewForPreview.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 5, widthConstant: self.frame.width/7, heightConstant: self.frame.width/7)
        
        labelRating.anchor(self.topAnchor, left: imageViewForPreview.rightAnchor, bottom: nil, right: self.rightAnchor,
                            topConstant: 15, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        
        labelTitle.anchor(labelRating.bottomAnchor, left: imageViewForPreview.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 3, leftConstant: 15, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        labelReleaseDate.anchor(labelTitle.bottomAnchor, left: imageViewForPreview.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor,
                                   topConstant: 3, leftConstant: 15, bottomConstant: 15, rightConstant: 0, widthConstant: 0, heightConstant: 16)
        
        addSubview(horizontalLine)
        horizontalLine.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        
    }

}


