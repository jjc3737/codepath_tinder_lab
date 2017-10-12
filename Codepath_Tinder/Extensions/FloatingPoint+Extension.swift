//
//  FloatingPoint+Extension.swift
//  Codepath_Tinder
//
//  Created by Jaehee Chung on 10/3/17.
//  Copyright © 2017 Jaehee Chung. All rights reserved.
//

import UIKit

extension FloatingPoint {
	var degreesToRadians: Self { return self * .pi / 180 }
	var radiansToDegrees: Self { return self * 180 / .pi}
}
