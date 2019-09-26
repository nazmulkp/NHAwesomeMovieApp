//
//  DetailedmovieViewController.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//



import UIKit


 class DetailedmovieViewController: UIViewController {
    private enum CellIdentifiers {
        static let id = "cellid"
    }
    
     var viewModel: MovieTCVM?
    
    var tableView : UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    
    
    fileprivate func setupView() {
        self.view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(MovieDetailsTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.id)
        //tableView.backgroundColor = UIColor.red
        tableView.dataSource = self
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension DetailedmovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.id, for: indexPath) as! MovieDetailsTableViewCell
            cell.viewModel = viewModel
        return cell
    }
}









