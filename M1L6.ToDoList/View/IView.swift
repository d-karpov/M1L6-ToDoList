//
//  IView.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

/// Протокол описывающий публичный интерфейс View
protocol IView: AnyObject {
	func render(_ viewData: ViewData) -> Void
}

extension ToDoListViewController: IView {
	
	/// Метод обеспечивающий передачу данных во view во время рендеринга ячеек
	/// - Parameter viewData: структура содержащая поля ячеек
	func render(_ viewData: ViewData) {
		self.viewData = viewData
	}
}
