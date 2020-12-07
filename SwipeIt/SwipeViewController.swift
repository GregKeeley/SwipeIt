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
            print("Something went wrong with the touching")
            return
        }
        location = touch.location(in: self.view)
        if viewToMove.frame.origin.x > 0 && viewToMove.frame.origin.x < view.frame.width {
            viewToMove.center.x = location.x
        } else {
            
        }
    }
    @IBAction func viewSwiped(_ sender: UIPanGestureRecognizer) {

    }
    
}
