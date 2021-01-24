//
//  AddTopicCoordinator.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import UIKit

class AddTopicCoordinator: Coordinator {
    let presenter: UINavigationController
    let dataManager: AddTopicDataManager
    var addTopicNavigationController: UINavigationController?
    var onTopicCreated: (() -> Void)?
    
    init(presenter: UINavigationController, dataManager: AddTopicDataManager) {
        self.presenter = presenter
        self.dataManager = dataManager
    }
    
    override func start() {
        let addTopicViewModel = AddTopicViewModel(dataManager: self.dataManager)
        addTopicViewModel.coordinatorDelegate = self
        
        let controller = AddTopicViewController(viewModel: addTopicViewModel )
        controller.title = "Create"
        controller.isModalInPresentation = true

        addTopicViewModel.addTopicViewDelegate = controller
        
        let navigationController = UINavigationController(rootViewController: controller)
        self.addTopicNavigationController = navigationController
        presenter.present(navigationController, animated: true, completion: nil)
    }
    
    override func finish() {
        addTopicNavigationController?.dismiss(animated: true, completion: nil)
    }
}

extension AddTopicCoordinator: AddTopicCoordinatorDelegate {
    func addTopicCancelButtonTapped() {
        self.finish()
    }
    
    func topicSuccessfullyAdded() {
        onTopicCreated?()
    }
}
