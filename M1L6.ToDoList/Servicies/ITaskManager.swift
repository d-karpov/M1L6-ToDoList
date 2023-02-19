//
//  ITaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

/// Протокол описывающий публичный интерфейс для Менеджера задач
///
/// Содержит методы:
///
/// func allTasks() -> [Task] - получить все задачи
///
/// func allCompletedTasks() -> [Task] - получить завершенные задачи
///
/// func allNotCompletedTasks() -> [Task] - получить не завершенные задачи
///
/// func addTask(_ task: Task) - добавить задачу
///
/// func deleteTask(_ task: Task) - удалить задачу
protocol ITaskManager {
	func allTasks() -> [Task]
	func allCompletedTasks() -> [Task]
	func allNotCompletedTasks() -> [Task]
	func addTask(_ task: Task)
	func deleteTask(_ task: Task)
}

extension TaskManager: ITaskManager { }

extension ImportantTask.Priority: CustomStringConvertible {
	var description: String {
		switch self.rawValue {
		case 1:
			return "!!!"
		case 2:
			return "!!"
		case 3:
			return "!"
		default:
			return ""
		}
	}
}
