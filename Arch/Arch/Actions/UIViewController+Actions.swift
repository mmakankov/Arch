//
//  UIViewController+Actions.swift
//  Arch
//
//  Created by Maxim Makankov on 12.11.2022.
//

import UIKit

extension UIViewController {
	@IBAction func showAlert(sender: AnyObject) {
		guard let cell = sender as? TextTableViewCell else { return }

		let alert = UIAlertController(
			title: "Нажата ячейка",
			message: cell.itemViewModel?.text,
			preferredStyle: .alert
		)
		alert.addAction(.init(title: "Ok", style: .default, handler: nil))

		present(alert, animated: true, completion: nil)
	}

	@objc func showActionSheet(sender: AnyObject) {
		guard let cell = sender as? DetailedTableViewCell else { return }

		let alert = UIAlertController(
			title: "Нажата ячейка",
			message: cell.itemViewModel?.text,
			preferredStyle: .actionSheet
		)
		alert.addAction(.init(title: "Ok", style: .default, handler: nil))

		present(alert, animated: true, completion: nil)
	}
}
