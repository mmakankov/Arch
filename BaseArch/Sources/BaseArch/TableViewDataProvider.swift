//
//  TableViewDataProvider.swift
//  BaseArch
//
//  Created by Maxim Makankov on 01.11.2022.
//

import Foundation

public protocol TableViewDataProvider {
	func numberOfSections() -> Int
	func numberOfRows(inSection section: Int) -> Int
	func itemForRow(atIndexPath indexPath: IndexPath) -> ItemViewModel?
	func title(forSection section: Int) -> String?
	func sectionIndexTitles() -> [String]?
}
