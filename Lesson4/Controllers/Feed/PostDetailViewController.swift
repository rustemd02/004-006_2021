//
//  StudentDetailViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit

protocol PostDetailViewControllerDelegate: AnyObject {
    func onDataChange(student: Post)
}

class PostDetailViewController: UIViewController {
    
    // MARK: - UI Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var pictureImageView: UIImageView?
    
    
    // MARK: - Properties
    var post: Post?
    weak var delegate: PostDetailViewControllerDelegate?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Init
    
    private func configure() {
        guard let post = post else { return }
        profileImageView.image = post.profilePicture
        authorLabel.text = post.author
        timestampLabel.text = post.timestamp
        contentTextView.text = post.content
        pictureImageView?.image = post.contentPicture
        
        if (post.contentPicture == nil){
            self.contentTextView?.transform = CGAffineTransform(translationX: 0, y: -370)
        }
    }
}
