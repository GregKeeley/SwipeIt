//
//  SwipeButtonViewController.swift
//  SwipeIt
//
//  Created by Gregory Keeley on 12/11/20.
//

import UIKit

class SwipeButtonViewController: UIViewController {

    @IBOutlet weak var swipeButtonToMove: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI() {
        swipeButtonToMove.layer.cornerRadius = swipeButtonToMove.frame.width / 2
        view.layer.cornerRadius = view.frame.height / 2
        self.view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    
}
