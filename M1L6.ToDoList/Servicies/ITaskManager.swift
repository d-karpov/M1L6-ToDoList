//
//  ITaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

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
