//
//  TopicDetailViewController.swift
//  DiscourseAPI
//
//  Created by Marc Perelló Sapiña on 19/1/21.
//

import UIKit

class TopicDetailViewController: UIViewController {
    
    let topicDetailViewModel: TopicDetailViewModel
    
    lazy var labelTopicID: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var labelTopicTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var topicIDStackView: UIStackView = {
        let labelTopicIDTitle = UILabel()
        labelTopicIDTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTopicIDTitle.text = NSLocalizedString("Topic ID: ", comment: "")
        labelTopicIDTitle.textColor = .black

        let topicIDStackView = UIStackView(arrangedSubviews: [labelTopicIDTitle, labelTopicID])
        topicIDStackView.translatesAutoresizingMaskIntoConstraints = false
        topicIDStackView.axis = .horizontal

        return topicIDStackView
    }()

    lazy var topicNameStackView: UIStackView = {
        let labelTopicTitleTitle = UILabel()
        labelTopicTitleTitle.text = NSLocalizedString("Topic name: ", comment: "")
        labelTopicTitleTitle.translatesAutoresizingMaskIntoConstraints = false

        let topicNameStackView = UIStackView(arrangedSubviews: [labelTopicTitleTitle, labelTopicTitle])
        topicNameStackView.translatesAutoresizingMaskIntoConstraints = false
        topicNameStackView.axis = .horizontal

        return topicNameStackView
    }()

    lazy var postsNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var postsNumberStackView: UIStackView = {
        let postsNumberTitleLabel = UILabel()
        postsNumberTitleLabel.text = NSLocalizedString("Number of posts: ", comment: "")
        postsNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        let postsNumberStackView = UIStackView(arrangedSubviews: [postsNumberTitleLabel, postsNumberLabel])
        postsNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        postsNumberStackView.axis = .horizontal

        return postsNumberStackView
    }()

    let deleteTopicButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red.withAlphaComponent(0.95)
        button.setTitle("CLOSE TOPIC", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(topicDetailViewModel: TopicDetailViewModel) {
        self.topicDetailViewModel = topicDetailViewModel
        super.init(nibName: "TopicDetailView", bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        view.addSubview(topicIDStackView)
        NSLayoutConstraint.activate([
            topicIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicIDStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        view.addSubview(topicNameStackView)
        NSLayoutConstraint.activate([
            topicNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            topicNameStackView.topAnchor.constraint(equalTo: topicIDStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(postsNumberStackView)
        NSLayoutConstraint.activate([
            postsNumberStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            postsNumberStackView.topAnchor.constraint(equalTo: topicNameStackView.bottomAnchor, constant: 8)
        ])

        view.addSubview(deleteTopicButton)
        NSLayoutConstraint.activate([
            deleteTopicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteTopicButton.topAnchor.constraint(equalTo: postsNumberStackView.bottomAnchor, constant: 8)
        ])
        deleteTopicButton.isHidden = true

        let leftBarButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        leftBarButtonItem.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
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
    
    @objc func deleteButtonTapped() {
        topicDetailViewModel.deleteButtonTapped()
    }
    
    fileprivate func showErrorFetchingTopicDetailAlert() {
        let alertMessage: String = NSLocalizedString("Error fetching topic detail\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func showErrorDeletingTopic() {
        let alertMessage: String = NSLocalizedString("Error deleting topic\nPlease try again later", comment: "")
        showAlert(alertMessage)
    }
    
    fileprivate func updateUI() {
        labelTopicID.text = topicDetailViewModel.topicDetailID
        labelTopicTitle.text = topicDetailViewModel.topicDetailTitle
        postsNumberLabel.text = topicDetailViewModel.numberOfPosts
        deleteTopicButton.isHidden = topicDetailViewModel.isDeletable
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
        updateUI()
    }
    
    func errorFetchingTopicDetail() {
        showErrorFetchingTopicDetailAlert()
    }
}
