//
//  CategoriesDataManager.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 20/1/21.
//

import Foundation

enum CategoriesDataManagerError: Error {
    case unknown
}

protocol CategoriesDataManager {
    func fetchCategories(completion: @escaping (Result<CategoriesResponse?, Error>) -> ())
}
