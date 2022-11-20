//
//  GenericTableViewCellFactoryTests.swift
//  
//
//  Created by Maxim Makankov on 19.11.2022.
//

import XCTest
@testable import BaseArch

class GenericTableViewCellFactoryTests: XCTestCase {

	var tableView: UITableViewMock!
	var itemViewModel: ItemViewModelMock!
	var factory: GenericTableViewCellFactory<UITableViewCellMock>!

    override func setUpWithError() throws {
		try super.setUpWithError()
		tableView = UITableViewMock()
		itemViewModel = ItemViewModelMock()
		factory = GenericTableViewCellFactory<UITableViewCellMock>(cellIdentifier: "")
    }

    override func tearDownWithError() throws {
		factory = nil
		tableView = nil
		itemViewModel = nil
		try super.tearDownWithError()
    }

    func testMakeCellSuccess() throws {
        // arrange
		let cell = UITableViewCellMock()
		cell.stubbedItemViewModel = itemViewModel
		tableView.stubbedDequeuedReusableCell = cell

		// act
		let result = factory.makeCell(for: tableView, at: IndexPath(row: 0, section: 0), with: itemViewModel)

		// assert
		XCTAssertEqual(result, cell)
		XCTAssertTrue(result is UITableViewCellMock)
		let resultCell = result as! UITableViewCellMock
		XCTAssertTrue(resultCell.itemViewModel != nil)
    }

	func testMakeCellFailure() throws {
		// arrange
		let cell = UITableViewCell()
		tableView.stubbedDequeuedReusableCell = cell

		// act
		let result = factory.makeCell(for: tableView, at: IndexPath(row: 0, section: 0), with: itemViewModel)

		// assert
		XCTAssertEqual(result, cell)
		XCTAssertFalse(result is UITableViewCellMock)
	}
}
