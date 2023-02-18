//
//  SceneDelegate.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		let viewController = ToDoListViewController()
		
		let navigationController = UINavigationController(rootViewController: viewController)
		navigationController.navigationBar.prefersLargeTitles = true
		
		guard let windowScene = scene as? UIWindowScene else { return }
		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}

