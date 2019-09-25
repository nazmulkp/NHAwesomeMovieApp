//
//  NowPlayingViewController.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController, AlertDisplayer {
    private enum CellIdentifiers {
        static let id = "cellid"
    }
    
    private var viewModel: NowPlayingViewModel!
 
    var tableView : UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    fileprivate func setupView() {
        self.view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(NowPlayingTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.id)
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.prefetchDataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupView()
         LLSpinner.spin()
         viewModel = NowPlayingViewModel(delegate: self)
         viewModel.fetchNowPlaying()
    }
}

extension NowPlayingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.id, for: indexPath) as! NowPlayingTableViewCell
//        cell.viewModel = viewModel.nowPlaying(at: indexPath.row)
//
        // 2
        if isLoadingCell(for: indexPath) {
           // cell.configure(with: .none)
        } else {
            cell.viewModel = viewModel.nowPlaying(at: indexPath.row)
        }
        
        return cell
        
        
    }
}

extension NowPlayingViewController: NowPlayingViewModelDelegate {
    
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        // 1
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            LLSpinner.stop()
            tableView.isHidden = false
            tableView.reloadData()
            return
        }
        // 2
//        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
//        tableView.reloadRows(at: indexPathsToReload, with: .automatic)
    }
    
    
    func onFetchFailed(with reason: String) {
        LLSpinner.stop()
        
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
    
    
}

private extension NowPlayingViewController {
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        print("viewing number\(indexPath.row) \(viewModel.totalCount) ,avabilalbe\(viewModel.currentCount)")
        return indexPath.row >= viewModel.currentCount
    }
    
    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}

extension NowPlayingViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchNowPlaying()
        }
    }
}


