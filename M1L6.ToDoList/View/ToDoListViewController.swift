//
//  ToDoListViewController.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import UIKit

/// Класс реализующий табличное представление списка задач.
///
/// Для работы необходима инъекция свойства presenter, реализующего протокол IPresenter
class ToDoListViewController: UITableViewController {
	
	private let cellIdentifier = "Cell"
	
	/// Презентер реализующий протокол IPresenter, добавляется путем property injection
	var presenter: IPresenter!
	
	/// Структура содержащая поля для отображения в ячейках
	var viewData: ViewData!

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
		title = presenter.setTitle()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
		return presenter.setNumberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.setNumberOfRowsInSection(at: section)
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return presenter.setTitleOfSection(at: section)
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		presenter.prepareCell(at: indexPath)
		var content = cell.defaultContentConfiguration()
		content.text = viewData.text
		content.secondaryText = viewData.secondaryText
		cell.accessoryType = viewData.isCompleted ? .checkmark : .none
		cell.backgroundColor = viewData.isOverDue ? .systemPink : .white
		cell.contentConfiguration = content
        return cell
    }
	// MARK: - Table view delegate
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.updateCell(at: indexPath)
		tableView.reloadData()
	}
}
