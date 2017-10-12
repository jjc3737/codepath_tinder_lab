//
//  ViewController.swift
//  Codepath_Tinder
//
//  Created by Jaehee Chung on 10/3/17.
//  Copyright © 2017 Jaehee Chung. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIViewControllerTransitioningDelegate {

	@IBOutlet var profileImageView: DraggableImageView!
	fileprivate let segueToDetail = "showDetailPage"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	@IBAction func profileImageTapped(_ sender: UITapGestureRecognizer) {
		performSegue(withIdentifier: segueToDetail, sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == segueToDetail {
			segue.destination.transitioningDelegate = self
		}
	}
	
	// MARK: UIViewControllerTransitioningDelegate
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return FadeTransition()
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return FadeTransition()
	}
}

