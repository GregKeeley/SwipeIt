//
//  SwipeViewController.swift
//  SwipeIt
//
//  Created by Gregory Keeley on 12/5/20.
//

import UIKit

class SwipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func viewSwiped(_ sender: UIPanGestureRecognizer) {
        print("Number of touches: \(sender.numberOfTouches)")
        print("State: \(sender.state.rawValue)")
    }
}
