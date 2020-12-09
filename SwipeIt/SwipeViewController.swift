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
        
        // Checks to make sure a touch has been detected, grabs the first touch from the Set of touches
        guard var touch = touches.first else {
            return
        }
        
        // Assigning originalViewLocation to location to assure we dont lose the value
        // ** not sure it's necessary since it's set to 0 currently **
        originalViewLocation = location
        
        // Assigning the first touch to location move the view to the touch point
        location = touch.location(in: self.view)
        
        // 1. check the X coordinate of the location to make sure its greater than the origin of the view to be moved
        if location.x > viewToMove.frame.origin.x {
            
            // 2. check that the center of the view to move (on the X-axis) is greater than 0, and it's within the width of the parent view before moving
            if viewToMove.center.x > 0 && viewToMove.center.x < view.frame.width {
                viewToMove.center.x = location.x
            } else {
                // (2) If the center of the view to move isn't within the parent view, move it back to the original location
                viewToMove.center.x = originalViewLocation.x
            }
        } else {
            // (1) If the touch location isn't greater than view to moves origin (X-Axis), move the view back to the original location
            viewToMove.center.x = originalViewLocation.x
        }
        while touches.count > 1 {
            touches.dropFirst()
            guard let touch = touches.first else {
                print("No second touch")
                return
            }
            viewToMove.center.x = touch.location(in: self.view).x
        }
    }
    @IBAction func viewSwiped(_ sender: UIPanGestureRecognizer) {

    }
    
}
