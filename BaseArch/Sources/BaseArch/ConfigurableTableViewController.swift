//
//  ConfigurableTableViewController.swift
//  BaseArch
//
//  Created by Maxim Makankov on 01.11.2022.
//

import Foundation
import UIKit

public protocol ConfigurableTableViewController where Self: UITableViewController {

	var dataSource: UITableViewDataSource? { get set }
	var delegate: UITableViewDelegate? { get set }
}
