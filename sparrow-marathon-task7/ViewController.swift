//
//  ViewController.swift
//  sparrow-marathon-task7
//
//  Created by Nikita Bekish on 19.02.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Private properties
    
    private let imageView = UIImageView(image: UIImage(named: "Swon6p_RU6s"))
    private let contentView = UIView()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 2)
         scroll.contentInsetAdjustmentBehavior = .never
        return scroll
    }()
    
    lazy var scrollViewTopAnchor: NSLayoutConstraint = scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor)
    lazy var imageViewHeightAnchor: NSLayoutConstraint = imageView.heightAnchor.constraint(equalToConstant: 270)

    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .black
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
        scrollView.indicatorStyle = .white
        scrollView.backgroundColor = .black
        
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewHeightAnchor,
            
            scrollViewTopAnchor,
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height * 2 - 100),
        ])
        
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetHeight = scrollView.contentOffset.y
        
        imageViewHeightAnchor.constant = 270 - contentOffsetHeight

        if contentOffsetHeight > 0 {
            scrollViewTopAnchor.constant = -contentOffsetHeight
        }
    }
}
