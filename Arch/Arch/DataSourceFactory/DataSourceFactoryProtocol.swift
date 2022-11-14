//
//  DataSourceFactoryProtocol.swift
//  Arch
//
//  Created by Maxim Makankov on 08.11.2022.
//

import UIKit

typealias TableViewFactoryProtocol = DataSourceFactoryProtocol & DelegateFactoryProtocol

protocol DataSourceFactoryProtocol {

	func makePlainListDataSource() -> UITableViewDataSource
	func makeSectionListDataSource() -> UITableViewDataSource
}

protocol DelegateFactoryProtocol {

	func makePlainListDelegate() -> UITableViewDelegate
	func makeSectionListDelegate() -> UITableViewDelegate
}
