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
        // After touches end, what do I want to do here?
        print("Touches ended")
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
        swipeButtonToMove.frame.origin.x = minViewCoords.x
    }
    private func moveViewWithTouch(_ touches: Set<UITouch>) {
        guard let touch = touches.first else {
            return
        }
        location = touch.location(in: self.view)
        if location.x > minViewCoords.x && location.x < maxViewCoords.x {
            if swipeButtonToMove.frame.minX >= minViewCoords.x && swipeButtonToMove.frame.maxX <= maxViewCoords.x {
                swipeButtonToMove.center.x = location.x
            } else {
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
