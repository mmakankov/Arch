//
//  TableViewDataSource.swift
//  BaseArch
//
//  Created by Maxim Makankov on 01.11.2022.
//

import Foundation
import UIKit

public class TableViewDataSource: NSObject {

	var dataProvider: TableViewDataProvider

	private lazy var itemViewModelTypeToFactoryMapping: [String: TableViewCellFactory] = [:]

	public init(dataProvider: TableViewDataProvider) {
		self.dataProvider = dataProvider
	}
}

extension TableViewDataSource {
	public func registerCell<Cell>(
		type: Cell.Type,
		identifier: String,
		for itemViewModelType: ItemViewModel.Type
	) where Cell: UITableViewCell & Configurable {
		let factory = GenericTableViewCellFactory<Cell>(cellIdentifier: identifier)
		let itemViewModelTypeString = "\(itemViewModelType)"
		itemViewModelTypeToFactoryMapping[itemViewModelTypeString] = factory
	}

	public func registerCell<Cell>(
		type: Cell.Type,
		for itemViewModelType: ItemViewModel.Type
	) where Cell: UITableViewCell & Configurable {
		registerCell(type: type, identifier: "\(type)", for: itemViewModelType)
	}

	private func cellFactory(viewModel: ItemViewModel) -> TableViewCellFactory? {
		let modelType = type(of: viewModel)
		let modelTypeString = "\(modelType)"
		return itemViewModelTypeToFactoryMapping[modelTypeString]
	}
}

extension TableViewDataSource: UITableViewDataSource {
	public func numberOfSections(in tableView: UITableView) -> Int {
		return dataProvider.numberOfSections()
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataProvider.numberOfRows(inSection: section)
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let itemViewModel = dataProvider.itemForRow(atIndexPath: indexPath),
			  let factory = cellFactory(viewModel: itemViewModel) else {
			return UITableViewCell()
		}

		let cell = factory.makeCell(for: tableView, at: indexPath, with: itemViewModel)

		return cell
	}

	public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return dataProvider.title(forSection: section)
	}

	public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		dataProvider.sectionIndexTitles()
	}
}
