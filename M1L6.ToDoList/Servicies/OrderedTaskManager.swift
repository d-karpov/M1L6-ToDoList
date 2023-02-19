//
//  OrderedTaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

/// Класс реализующий сортировку по приоритетам для Менеджера задач реализован как Декоратор
final class OrderedTaskManager: ITaskManager {
	private let taskManager: ITaskManager
	
	init(_ taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Метод для получения всех задач
	/// - Returns: массив всех задач
	func allTasks() -> [Task] {
		taskManager.allTasks()
	}
	
	/// Метод для получения завершенных задач отсортированный по приоритету
	/// - Returns: массив всех завершенных задач
	func allCompletedTasks() -> [Task] {
		sortedByPriority(taskManager.allCompletedTasks())
	}
	
	/// Метод для получения не завершенных задач отсортированный по приоритету
	/// - Returns: массив всех не завершенных задач
	func allNotCompletedTasks() -> [Task] {
		sortedByPriority(taskManager.allNotCompletedTasks())
	}
	
	/// Метод добавления задачи
	/// - Parameter task: задача
	func addTask(_ task: Task) {
		taskManager.addTask(task)
	}
	
	/// Метод удаления задачи
	/// - Parameter task: задача
	func deleteTask(_ task: Task) {
		taskManager.deleteTask(task)
	}
	
	private func sortedByPriority(_ tasks:[Task]) -> [Task] {
		tasks.sorted {
			if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue < task1.priority.rawValue
			}
			
			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}
			
			if $0 is RegularTask, $1 is ImportantTask {
				return false
			}
			
			return true
		}
	}
}
