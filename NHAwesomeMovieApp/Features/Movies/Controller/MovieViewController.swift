//
//  NowPlayingViewController.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import UIKit


internal class MovieViewController: UIViewController, AlertDisplayer {
    private enum CellIdentifiers {
        static let id = "cellid"
    }
    
     var viewModel: MovieViewModel!
 
    var tableView : UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    fileprivate func setupView() {
        self.view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.id)
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 600
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.prefetchDataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupView()
//         LLSpinner.spin()
//         viewModel = NowPlayingViewModel(pageName: "now_playing", delegate: self)
//         viewModel.fetchNowPlaying()
    }
}

extension MovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Hints:- Initial count almost 1200+ it's shound not best practice. if you want to use this code as production then you should use 2D array. and keep 60-100 item only that array when scrolling down adding 20 item end of the array then you must be remove 20 item from beginning of the array. and when scrolling up adding 20 item from beginning of the array then remove 20 item from end of the array. 
        return viewModel.totalCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.id, for: indexPath) as! MovieTableViewCell
        // 2
        if isLoadingCell(for: indexPath) {
           //TODO
        } else {
            cell.viewModel = viewModel.movie(at: indexPath.row)
        }
        
        return cell
        
        
    }
}

extension MovieViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailedmovieViewController()
        controller.viewModel = viewModel.movie(at: indexPath.row)
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension MovieViewController: MovieViewModelDelegate {
    
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

private extension MovieViewController {
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

extension MovieViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            viewModel.fetchMovies()
        }
    }
}









