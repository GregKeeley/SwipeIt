//
//  ViewController.swift
//  SwipeIt
//
//  Created by Gregory Keeley on 12/4/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI() {
        buttonContainerView.layer.masksToBounds = true
        buttonContainerView.layer.cornerRadius = buttonContainerView.frame.height / 2
    }
}

