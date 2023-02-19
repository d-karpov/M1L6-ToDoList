//
//  IView.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

protocol IView {
	func render(_ viewData: ViewData) -> Void
}

extension ToDoListViewController: IView {
	func render(_ viewData: ViewData) {
	}
}
