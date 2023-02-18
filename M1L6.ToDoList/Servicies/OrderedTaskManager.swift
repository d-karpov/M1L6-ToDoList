//
//  OrderedTaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

final class OrderedTaskManager: ITaskManager {
	private let taskManager: ITaskManager
	
	init(_ taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	func allTasks() -> [Task] {
		taskManager.allTasks()
	}
	
	func allCompletedTasks() -> [Task] {
		taskManager.allCompletedTasks()
	}
	
	func allNotCompletedTasks() -> [Task] {
		taskManager.allNotCompletedTasks()
	}
	
	func addTask(_ task: Task) {
		taskManager.addTask(task)
	}
	
	func deleteTask(_ task: Task) {
		taskManager.deleteTask(task)
	}
	
	private func sortedByPriority(_ tasks:[Task]) -> [Task] {
		tasks.sorted {
			if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
				return task0.priority.rawValue > task1.priority.rawValue
			}
			
			if $0 is ImportantTask, $1 is RegularTask {
				return true
			}
			
			if $0 is RegularTask, $1 is ImportantTask {
				return true
			}
			
			return true
		}
	}
}
