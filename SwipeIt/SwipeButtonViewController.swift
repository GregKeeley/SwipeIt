//
//  SwipeButtonViewController.swift
//  SwipeIt
//
//  Created by Gregory Keeley on 12/11/20.
//

import UIKit

// Notes: Pan gesture seems unecessary to make this work (the view, in this case the UIButton that needs to move)
// Registering the touches is the crucial part, then we can move what we need,

class SwipeButtonViewController: UIViewController {

    @IBOutlet weak var swipeButtonToMove: UIButton!
    
    var location = CGPoint(x:0, y:0)
    var minViewCoords = CGPoint(x: 0, y: 0) {
        didSet {
            print("\(minViewCoords.x)")
        }
    }
    var maxViewCoords = CGPoint(x: 0, y: 0) {
        didSet {
            print("\(maxViewCoords.x)")
        }
    }
    var touches: Set<UITouch>?
     //MARK:- Override touches funcs
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touches = touches
        moveViewWithTouch(touches)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touches = touches
        moveViewWithTouch(touches)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touches?.removeAll()
        resetButtonToOriginLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadInformation()
    }
    
    func configureUI() {
        swipeButtonToMove.layer.cornerRadius = swipeButtonToMove.frame.width / 2
        self.view.layer.cornerRadius = view.frame.height / 2
    }
    func loadInformation() {
        minViewCoords.x = view.frame.minX + 4
        maxViewCoords.x = view.frame.maxX - 4
    }
    private func resetButtonToOriginLocation() {
        if location.x > maxViewCoords.x / 2 {
            swipeButtonToMove.center.x = maxViewCoords.x - (swipeButtonToMove.frame.width + 4)
        } else {
            swipeButtonToMove.frame.origin.x = minViewCoords.x
        }
    }
    private func moveViewWithTouch(_ touches: Set<UITouch>) {
        
        guard let touch = touches.first else {
            return
        }
        location = touch.location(in: self.view)
        
        
    // These two if statements check to see if the location of the touch, and the button are within the limits of the its parents view.
        // If the location being touched is greater than the minimum coordinates, and less than max coordinates, continue
        if location.x > minViewCoords.x && location.x < maxViewCoords.x {
            // If leading edge (essentially?) is greater than the minimum coordinates, and less the max, continue
            if swipeButtonToMove.frame.minX >= minViewCoords.x && swipeButtonToMove.frame.maxX <= maxViewCoords.x {
                // This will move the button to the location being touched
                swipeButtonToMove.center.x = location.x
            } else {
                // Otherwise, lets put the button back where it started
                resetButtonToOriginLocation()
            }
        } else {
            resetButtonToOriginLocation()
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let touches = self.touches else { return }
        moveViewWithTouch(touches)
    }
}
