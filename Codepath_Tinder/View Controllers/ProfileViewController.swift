//
//  ProfileViewController.swift
//  Codepath_Tinder
//
//  Created by Jaehee Chung on 10/5/17.
//  Copyright © 2017 Jaehee Chung. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	@IBOutlet var profileView: UIImageView!
	
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		

        // Do any additional setup after loading the view.
    }

	@IBAction func tappedDone(_ sender: UITapGestureRecognizer) {
		dismiss(animated: true, completion: nil)
	}
	
}
