//
//  SectionsForTaskManagerAdapter.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation


/// Протокол описывающий методы Адаптера секций для менеджера задач
///
/// Содержит два обязательных метода:
///
/// func getTitlesOfSections() -> [String] - получить массив заголовков секции
///
/// func getSectionTasks(at section: Int) -> [Task] - получить задачи для конкретной секции
protocol ISectionsForTaskManagerAdapter {
	func getTitlesOfSections() -> [String]
	func getSectionTasks(at section: Int) -> [Task]
}

/// Класс реализующий протокол ISectionsForTaskManagerAdapter и представляющий из
/// себя Адаптер для Менеджера задач. 
final class SectionsForTaskMangerAdapter: ISectionsForTaskManagerAdapter {
	private let taskManager: ITaskManager
	
	init(_ taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Создает массив заголовок для секций таблицы
	/// - Returns: массив заголовков для секций
	func getTitlesOfSections() -> [String] {
		return ["Completed","Not completed"]
	}
	
	/// На основе номера секции формирует список задач, которые должны там разместиться
	/// - Parameter section: номер секции
	/// - Returns: массив задач
	func getSectionTasks(at section: Int) -> [Task] {
		switch section {
		case 1:
			return taskManager.allCompletedTasks()
		default:
			return taskManager.allNotCompletedTasks()
		}
	}
}
