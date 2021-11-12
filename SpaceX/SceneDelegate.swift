//
//  SceneDelegate.swift
//  SpaceX
//
//  Created by Daniel Okoronkwo on 09/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }

    func configureWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private lazy var navigationController = UINavigationController(
        rootViewController: HomeViewController(
            viewModel: SpaceXViewModelAdapter(
                companyRepo: CompanyRepoProvider(httpClient: httpClient, baseUrl: Constants.baseURL),
                rocketRepo: RocketProvider(httpClient: httpClient, baseUrl: Constants.baseURL),
                launchListRepo: LaunchListProvider(httpClient: httpClient, baseUrl: Constants.baseURL)
            )
        )
    )

}

