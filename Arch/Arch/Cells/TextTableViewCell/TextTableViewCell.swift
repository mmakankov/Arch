//
//  TextTableViewCell.swift
//  Arch
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit
import BaseArch

class TextTableViewCell: UITableViewCell, Configurable {

	var itemViewModel: TextViewModelProtocol? {
		didSet {
			textLabel?.text = itemViewModel?.text
		}
	}
}
