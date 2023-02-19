//
//  Repository.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

protocol IRepository {
	associatedtype T
	
	func list() -> [T]
}

final class StubRepository: IRepository {
	typealias T = Task
	
	func list() -> [T] {
		let tasks = [
			ImportantTask(title: "See lesson", completed: true, priority: .low),
			RegularTask(title: "Go to shop", completed: false),
			RegularTask(title: "Create Stub for lesson", completed: true),
			ImportantTask(title: "Make Swiftbook homework", completed: false, priority: .high),
			ImportantTask(title: "Make lesson's test", completed: false, priority: .medium)
		]
		return tasks
	}
}
