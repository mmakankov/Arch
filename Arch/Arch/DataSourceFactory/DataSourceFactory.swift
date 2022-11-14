//
//  DataSourceFactory.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import Foundation
import BaseArch
import UIKit

class DataSourceFactory {

	let arrayDataProvider: TableViewDataProvider
	let sectionsDataProvider: TableViewDataProvider

	init() {
		let sections = [
			Section(objects: textViewModels, name: "Section 1", index: "1"),
			Section(objects: detailedTextViewModels, name: "Section 2", index: "2")
		]
		arrayDataProvider = ArrayDataProvider(array: textViewModels)
		sectionsDataProvider = SectionsDataProvider(sections: sections)
	}

	private let textViewModels = [
		TextViewModel(text: "Cell 1"),
		TextViewModel(text: "Cell N2"),
		TextViewModel(text: "Cell #3")
	]

	private let detailedTextViewModels = [
		DetailedViewModel(text: "Text1", detailedText: "Details 1"),
		DetailedViewModel(text: "Text2", detailedText: "Details 2"),
		DetailedViewModel(text: "Text3", detailedText: "Details 3")
	]
}

extension DataSourceFactory: DataSourceFactoryProtocol {
	func makePlainListDataSource() -> UITableViewDataSource {
		let dataSource = TableViewDataSource(dataProvider: arrayDataProvider)
		dataSource.registerCell(type: TextTableViewCell.self, for: TextViewModel.self)
		return dataSource
	}

	func makeSectionListDataSource() -> UITableViewDataSource {
		let dataSource = TableViewDataSource(dataProvider: sectionsDataProvider)
		dataSource.registerCell(type: TextTableViewCell.self, for: TextViewModel.self)
		dataSource.registerCell(type: DetailedTableViewCell.self, for: DetailedViewModel.self)
		return dataSource
	}
}

extension DataSourceFactory: DelegateFactoryProtocol {
	func makePlainListDelegate() -> UITableViewDelegate {
		TableViewDelegate(dataProvider: arrayDataProvider, map: makeMap())
	}

	func makeSectionListDelegate() -> UITableViewDelegate {
		TableViewDelegate(dataProvider: sectionsDataProvider, map: makeMap())
	}

	func makeMap() -> [String: Selector] {
		let firstSelector = #selector(UIViewController.showAlert(sender:))
		let secondSelector = #selector(UIViewController.showActionSheet(sender:))
		let map = [
			"\(TextViewModel.self)": firstSelector,
			"\(DetailedViewModel.self)": secondSelector,
		]
		return map
	}
}
