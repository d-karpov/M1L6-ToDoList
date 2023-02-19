//
//  ViewData.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

/// Структура описывающая поля ячейки таблицы
struct ViewData {
	let text: String
	let secondaryText: String?
	let isOverDue: Bool
	var isCompleted: Bool
}
