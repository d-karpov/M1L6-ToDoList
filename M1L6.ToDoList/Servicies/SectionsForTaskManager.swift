//
//  SectionsForTaskManager.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation


protocol ISectionForTaskManager {
	func getTitlesOfSections(at section: Int) -> [String]
	func getSectionTasks(at section: Int) -> [Task]
}

final class SectionForTaskManger: ISectionForTaskManager {
	private let taskManager: ITaskManager
	
	init(_ taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	func getTitlesOfSections(at section: Int) -> [String] {
		return ["Completed","Not completed"]
	}
	
	func getSectionTasks(at section: Int) -> [Task] {
		switch section {
		case 1:
			return taskManager.allCompletedTasks()
		default:
			return taskManager.allNotCompletedTasks()
		}
	}
}
