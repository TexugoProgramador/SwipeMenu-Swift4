//
//  ViewController.swift
//  SwipeMenu-Swift4
//
//  Created by Humberto Puccinelli on 16/04/2018.
//  Copyright © 2018 Humberto Puccinelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var MeuViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sideView: UIView!
   
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        btn1.layer.cornerRadius = 15
        btn2.layer.cornerRadius = 15
        blurView.layer.cornerRadius = 15
        MeuViewConstraint.constant = -175
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chamaMenu(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed{
            
            let transicao = sender.translation(in: self.view).x
            
            if transicao > 0 { // movimento para direita x positivo
                
                if MeuViewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2) {
                        self.MeuViewConstraint.constant += transicao / 10
                        self.view.layoutIfNeeded()
                    }
                }
                
            }else{ // movimento para esquerda X negativo
                
                if MeuViewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2) {
                        self.MeuViewConstraint.constant += transicao / 10
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }else if sender.state == .ended {
            if MeuViewConstraint.constant < -100 {
                
                UIView.animate(withDuration: 0.2) {
                    self.MeuViewConstraint.constant = -175
                    self.view.layoutIfNeeded()
                }
            }else{
                UIView.animate(withDuration: 0.2) {
                    self.MeuViewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
}

