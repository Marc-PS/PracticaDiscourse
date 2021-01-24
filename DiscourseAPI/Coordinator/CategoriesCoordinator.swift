//
//  CategoriesCoordinator.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 18/1/21.
//

import UIKit

class CategoriesCoordinator: Coordinator {
    let presenter: UINavigationController
    let categoriesDataManager: CategoriesDataManager

    init(presenter: UINavigationController, categoriesDataManager: CategoriesDataManager) {
        self.presenter = presenter
        self.categoriesDataManager = categoriesDataManager
        
    }
    
    override func start() {
        let categoriesViewModel = CategoriesViewModel(categoriesDataManager: self.categoriesDataManager)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        categoriesViewController.title = NSLocalizedString("Categories", comment: "")
        categoriesViewModel.categoryViewDelegate = categoriesViewController
        presenter.pushViewController(categoriesViewController, animated: false)
    }
    
    override func finish() {}

}
