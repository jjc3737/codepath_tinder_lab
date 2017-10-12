//
//  DraggableImageView.swift
//  Codepath_Tinder
//
//  Created by Jaehee Chung on 10/3/17.
//  Copyright © 2017 Jaehee Chung. All rights reserved.
//

import UIKit

class DraggableImageView: UIImageView {
	
	@IBOutlet var contentView: UIView!
	@IBOutlet var profileImage: UIImageView!
	
	fileprivate var initialCenter: CGPoint!
	fileprivate let panThreshold: CGFloat = 125
	fileprivate let duration: Double = 0.3
	fileprivate let centerOffScreen: CGFloat = 1000
	fileprivate let rotationScale: CGFloat = 20.0
	
	//Needed for using this view in storyboards
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initSubviews()
	}
	
	//Needed for using this view programatically
	override init(frame: CGRect) {
		super.init(frame: frame)
		initSubviews()
	}
	
	fileprivate func initSubviews() {
		// standard initialization logic
		let nib = UINib(nibName: "DraggableImageView", bundle: nil)
		nib.instantiate(withOwner: self, options: nil)
		contentView.frame = bounds
		addSubview(contentView)
		
	}
	
	@IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
		let translation = recognizer.translation(in: self)
		let touchLocation = recognizer.location(in: self)
		
		switch recognizer.state {
		case .began:
			initialCenter = recognizer.view?.center
		case .changed:
			//Top: rotate clockwise when dragging right
			if touchLocation.y <= initialCenter.y {
				transform = CGAffineTransform(rotationAngle: (translation.x / rotationScale).degreesToRadians)
			} else {
				//Bottom: rotate clockwise when dragging left
				transform = CGAffineTransform(rotationAngle: (-translation.x / rotationScale).degreesToRadians)
			}
			recognizer.view?.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y)
		case .ended:
			if translation.x > panThreshold {
				UIView.animate(withDuration: duration, animations: {
					recognizer.view?.center.x = self.centerOffScreen
				})
			} else if translation.x < -panThreshold {
				UIView.animate(withDuration: duration, animations: {
					recognizer.view?.center.x = -self.centerOffScreen
				})
			} else {
				UIView.animate(withDuration: duration, animations: {
					recognizer.view?.center = self.initialCenter
					self.transform = .identity
				})
			}
		default:
			break
		}
		
	}

}
