//
//  TopicDetailViewController.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import UIKit

class TopicDetailViewController: UIViewController {
    
    let topicDetailViewModel: TopicDetailViewModel
    
    @IBOutlet weak var topicIDLabel: UILabel!
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var numberOfPostsLabel: UILabel!
    
    @IBAction func deleteTopicButton(_ sender: Any) {
        topicDetailViewModel.deleteButtonTapped()
    }
    
    init(topicDetailViewModel: TopicDetailViewModel) {
        self.topicDetailViewModel = topicDetailViewModel
        super.init(nibName: "TopicDetailView", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        topicDetailViewModel.viewDidLoad()
    }
    
    @objc fileprivate func backButtonTapped() {
        topicDetailViewModel.backButtonTapped()
    }
    
    fileprivate func showErrorFetchingTopicDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching topic detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func showErrorDeletingTopic() {
        let alertMessage: String = NSLocalizedString("Error deleting topic\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    

}

extension TopicDetailViewController: TopicDetailViewDelegate {
    func errorDeletingTopic() {
        showErrorDeletingTopic()
    }
    
    func didDeleteTopic() {
        topicDetailViewModel.coordinatorDelegate?.topicDetailBackButtonTapped()
    }
    
    func topicDetailFetched() {
        self.topicIDLabel.text = topicDetailViewModel.topicDetailID
        self.topicTitleLabel.text = topicDetailViewModel.topicDetailTitle
        self.numberOfPostsLabel.text = topicDetailViewModel.numberOfPosts?.description
        
        
    }
    
    func errorFetchingTopicDetail() {
        showErrorFetchingTopicDetailAlert()
    }
}
