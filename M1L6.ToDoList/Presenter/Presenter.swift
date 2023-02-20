//
//  Presenter.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import Foundation
/// Протокол описывает публичный интерфейс презентора для таблицы.
///
/// Обязывает реализовать следующие методы:
///
/// func setTitle() -> String - подготовить заголовок таблицы
///
/// func setNumberOfSections() -> Int - вычислить номера секций
///
/// func setTitleOfSection(at section: Int) -> String - подготовить заголовок для секции
///
/// func setNumberOfRowsInSection(at section: Int) -> Int - вычислить количество строк в секции
///
/// func prepareCell(at indexPath: IndexPath) -> Void - подготовить структуру ViewData для конкретной ячейки
///
/// func updateCell(at indexPath: IndexPath) -> Void - обновить данные конкретной ячейки
protocol IPresenter {
	func setTitle() -> String
	func setNumberOfSections() -> Int
	func setTitleOfSection(at section: Int) -> String
	func setNumberOfRowsInSection(at section: Int) -> Int
	func prepareCell(at indexPath: IndexPath) -> Void
	func updateCell(at indexPath: IndexPath) -> Void
}
/// Класс реализующий презентер в соотвествии с протоколом IPresenter
final class Presenter: IPresenter {
	
	private weak var view: IView?
	private let sectionManager: ISectionsForTaskManagerAdapter
	
	init(view: IView, sectionManager: ISectionsForTaskManagerAdapter) {
		self.view = view
		self.sectionManager = sectionManager
	}
	/// Метод готовит заголовк для секции таблицы
	/// - Parameter section: номер секции
	/// - Returns: название секции
	public func setTitleOfSection(at section: Int) -> String {
		return sectionManager.getTitlesOfSections()[section]
	}
	/// Готовит общий заголовок таблицы
	/// - Returns: заголовок
	public func setTitle() -> String {
		return "To Do List"
	}
	/// Вычисляет количество секций для таблицы
	/// - Returns: количество секций
	public func setNumberOfSections() -> Int {
		return sectionManager.getTitlesOfSections().count
	}
	/// Вычисляет количество строк для конкретной секции таблицы
	/// - Parameter section: номер секции
	/// - Returns: количество строк
	public func setNumberOfRowsInSection(at section: Int) -> Int {
		return sectionManager.getSectionTasks(at: section).count
	}
	/// Метод готовит данные для конкретной ячейки в зависимости от типа
	/// и отправляет view задание на отрисовку.
	/// - Parameter indexPath: индекс конкретной ячейки
	public func prepareCell(at indexPath: IndexPath) {
		let task = sectionManager.getSectionTasks(at: indexPath.section)[indexPath.row]
		if let task = task as? ImportantTask {
			let dueDateText = task.dueDate.formatted(date: .numeric, time: .omitted)
			view?.render(ViewData(
				text: task.title,
				secondaryText: "Priority - \(task.priority)  Deadline: \(dueDateText)",
				isOverDue: Date.now > task.dueDate,
				isCompleted: task.completed)
			)
		}
		
		if let task = task as? RegularTask {
			view?.render(ViewData(
				text: task.title,
				secondaryText: nil,
				isOverDue: false,
				isCompleted: task.completed)
			)
		}
	}
	
	/// Метод который обновляет статус завершения работы
	/// - Parameter indexPath: индекс конкретной ячейки
	public func updateCell(at indexPath: IndexPath) {
		let task = sectionManager.getSectionTasks(at: indexPath.section)[indexPath.row]
		task.completed.toggle()
	}
}
