//
//  File.swift
//  
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit

open class TableViewController: UITableViewController, ConfigurableTableViewController {

	public var dataSource: UITableViewDataSource? {
		didSet {
			guard isViewLoaded else { return }

			tableView.dataSource = dataSource
			tableView.reloadData()
		}
	}

	public var delegate: UITableViewDelegate? {
		didSet {
			guard isViewLoaded else { return }

			tableView.delegate = delegate
			tableView.reloadData()
		}
	}

	override open func viewDidLoad() {
		super.viewDidLoad()

		tableView.dataSource = dataSource
		tableView.delegate = delegate
		tableView.reloadData()
	}
}
