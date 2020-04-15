//
//  MovieListViewController.swift
//  StoreLayer
//
//  Created by Alex on 11/04/2020.
//  Copyright © 2020 tonezone. All rights reserved.
//

import UIKit
import SwiftHelpers

final class MovieListViewController: UIViewController {
    private(set) var tableView: UITableView
    private(set) var refreshControl: UIRefreshControl
    private var refreshHandler: () -> () = {}
    
    @objc private func pulledToRefresh() {
        refreshHandler()
    }
    
    init(refreshHandler: @escaping () -> ()) {
        tableView = UITableView()
        refreshControl = UIRefreshControl()
        self.refreshHandler = refreshHandler
        super.init(nibName: nil, bundle: nil)
        
        view.addSubview(tableView, constraints: [.left(), .right(), .bottom(), .top()])
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
                        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseID)
        tableView.backgroundColor = .background
        tableView.separatorColor = .clear
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refreshControl
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
