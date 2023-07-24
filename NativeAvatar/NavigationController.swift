//
//  NavigationController.swift
//  NativeAvatar
//
//  Created by Mikhail Andreev on 24.07.2023.
//

import UIKit

class NavigationController: UINavigationController
{
	private lazy var imageView: UIImageView = {
		let image = UIImage(systemName: "person.crop.circle.fill")
		let imageView = UIImageView(image: image)
		imageView.tintColor = .lightGray
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

    override func viewDidLoad()
	{
        super.viewDidLoad()
		navigationBar.prefersLargeTitles = true
		delegate = self
		view.addSubview(imageView)
    }
}

extension NavigationController: UINavigationControllerDelegate
{
	func navigationController(
		_ navigationController: UINavigationController,
		willShow viewController: UIViewController,
		animated: Bool
	) {
		guard
			let largeTitleView = navigationBar.subviews.first(
				where: {
					NSStringFromClass($0.classForCoder).contains("UINavigationBarLargeTitleView")
				}
			)
		else
		{
			return
		}

		largeTitleView.addSubview(imageView)
		let label = largeTitleView.subviews.first { $0 is UILabel }
		let rightPadding = -1 * (label?.frame.origin.x ?? 16)
		let safeArea = largeTitleView.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: 36),
			imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
			imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: rightPadding),
			imageView.centerYAnchor.constraint(equalTo: label?.centerYAnchor ?? safeArea.bottomAnchor)
		])
	}
}
