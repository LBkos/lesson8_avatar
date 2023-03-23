//
//  ViewController.swift
//  lesson 8 navigationAvatar
//
//  Created by Константин Лопаткин on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.tintColor = .systemGray3
            
        view.backgroundColor = .white
        
        scrollView.contentSize = .init(width: view.bounds.width, height: 2000)
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        setNavigationView()

        view.addSubview(scrollView)
        scrollView.frame = .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
    }
    
    func setNavigationView() {
        
        guard let navigationBar = navigationController?.navigationBar else {
            return
        }
        title = "Avatar"
        
        guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }

        navigationBar.subviews.forEach { subview in
            if subview.isKind(of: UINavigationBarLargeTitleView.self) {
                
                subview.addSubview(imageView)
            }
        }
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                             constant: -16),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                              constant: -12),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])

    }
}
