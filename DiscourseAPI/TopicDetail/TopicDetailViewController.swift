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
    @IBOutlet weak var deleteTopicButton: UIButton!
    
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
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if let id = Int(topicIDLabel.text!) {
            topicDetailViewModel.deleteButtonTapped(id: id)
        }
    }
}

extension TopicDetailViewController: TopicDetailViewDelegate {
    func didDeleteTopic() {
        topicDetailViewModel.coordinatorDelegate?.topicDetailBackButtonTapped()
    }
    
    func topicDetailFetched() {
        self.topicIDLabel.text = topicDetailViewModel.topicDetailID
        self.topicTitleLabel.text = topicDetailViewModel.topicDetailTitle
        self.numberOfPostsLabel.text = topicDetailViewModel.numberOfPosts?.description
        if let deletable = topicDetailViewModel.isDeletable{
            self.deleteTopicButton.setTitleColor(.red, for: .normal)
            self.deleteTopicButton.isEnabled = deletable
        }
    }
    
    func errorFetchingTopicDetail() {
        showErrorFetchingTopicDetailAlert()
    }
}
