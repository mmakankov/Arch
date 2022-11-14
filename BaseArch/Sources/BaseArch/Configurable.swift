//
//  File.swift
//  
//
//  Created by Maxim Makankov on 02.11.2022.
//

import UIKit

public protocol Configurable where Self: UIView {
	associatedtype ItemModel
	var itemViewModel: ItemModel { get set }
}
