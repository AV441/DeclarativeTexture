//
//  SceneDelegate.swift
//  DeclarativeTextureDemo
//
//  Created by Андрей Ведищев on 17.12.2023.
//

import UIKit
import AsyncDisplayKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window?.windowScene = scene
        window?.rootViewController = UINavigationController(rootViewController: BidirectionalViewController())
        window?.makeKeyAndVisible()
    }
}

