//
//  MainAssembler.swift
//  Arch
//
//  Created by Maxim Makankov on 12.11.2022.
//

import UIKit
import BaseArch

class MainAssembler {

	private let factory = DataSourceFactory()

	func createSectionListViewController() -> UIViewController {
		let viewController = TableViewController()
		viewController.title = "Title 1"
		viewController.tableView = MyTableView()
		viewController.delegate = factory.makeSectionListDelegate()
		viewController.dataSource = factory.makeSectionListDataSource()

		return viewController
	}

	func createPlainListViewController() -> UIViewController {
		let viewController = TableViewController()
		viewController.title = "Title 2"
		viewController.tableView = MyTableView()
		viewController.delegate = factory.makePlainListDelegate()
		viewController.dataSource = factory.makePlainListDataSource()

		return viewController
	}
}
