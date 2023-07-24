//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Mikhail Andreev on 24.07.2023.
//

import UIKit

class ViewController: UIViewController
{
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView(frame: view.frame)
		scrollView.contentSize = .init(width: view.frame.width, height: view.frame.height * 5)
		return scrollView
	}()

	override func viewDidLoad()
	{
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		view.addSubview(scrollView)
		title = "Avatar"
	}
}
