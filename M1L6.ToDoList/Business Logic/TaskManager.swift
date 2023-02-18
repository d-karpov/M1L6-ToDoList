//
//  TaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

final class TaskManager {
	private var tasks: [Task]
	
	init(with tasks: [Task]) {
		self.tasks = tasks
	}
	
	func allTasks() -> [Task] {
		tasks
	}
	
	func allCompletedTasks() -> [Task] {
		tasks.filter { task in task.completed }
	}
	
	func allNotCompletedTasks() -> [Task] {
		tasks.filter { task in !task.completed }
	}
	
	func addTask(_ task: Task) {
		tasks.append(task)
	}
	
	func deleteTask(_ task: Task) {
		tasks.removeAll { currentTask in currentTask === task }
	}
}
