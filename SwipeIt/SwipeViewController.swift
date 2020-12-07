//
//  SwipeViewController.swift
//  SwipeIt
//
//  Created by Gregory Keeley on 12/5/20.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet weak var swipableView: UIView!
    @IBOutlet weak var viewToMove: UIView!
    
    var location = CGPoint(x:0, y:0)
    var originalViewLocation = CGPoint(x:0, y: 0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveView(touches)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveView(touches)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    private func moveView(_ touches: Set<UITouch>) {
        guard let touch = touches.first else {
            return
        }
        originalViewLocation = location
        location = touch.location(in: self.view)
        if location.x > viewToMove.frame.origin.x {
            if viewToMove.center.x > 0 && viewToMove.center.x < view.frame.width {
                viewToMove.center.x = location.x
            } else {
                viewToMove.center.x = originalViewLocation.x
            }
        } else {
            viewToMove.center.x = originalViewLocation.x
        }
    }
    @IBAction func viewSwiped(_ sender: UIPanGestureRecognizer) {

    }
    
}
