//
//  Tasks.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation

class Task {
	let title: String
	var completed: Bool
	
	init(title: String, completed: Bool) {
		self.title = title
		self.completed = completed
	}
}

final class RegularTask: Task { }


final class ImportantTask: Task {
	
	enum Priority: Int {
		case high = 1, medium, low
	}
	
	var priority: Priority
	var dueDate: Date {
		getDueDate()
	}
	
	init(title: String, completed: Bool, priority: Priority) {
		self.priority = priority
		super.init(title: title, completed: completed)
	}
	
	private func getDueDate() -> Date {
		Calendar.current.date(byAdding: .day,value: priority.rawValue,to: Date.now)!
	}
}
