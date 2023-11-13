//
//  ViewController.swift
//  Animation
//
//  Created by Tekla Matcharashvili on 12.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .systemCyan
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textLabel)
        
        animateText()
    }
    
    func animateText() {
        textLabel.frame = CGRect(x: 0, y: view.frame.size.height, width: view.frame.size.width, height: 50)
        textLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, animations: {
            self.textLabel.frame.origin.y = self.view.center.y - self.textLabel.frame.size.height / 2
        }) { (completed) in
            UIView.animate(withDuration: 1.0, animations: {
                self.textLabel.alpha = 1.0
                self.textLabel.frame.origin.y -= 20
            }) { (completed) in
                UIView.animate(withDuration: 1.0, animations: {
                    self.textLabel.frame.origin.y += 40
                    self.textLabel.alpha = 0.2
                }) { (completed) in
                    self.textLabel.frame.origin.y = self.view.frame.size.height
                    self.textLabel.alpha = 0.0
                    
                    Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
                        self.animateText()
                    }
                }
            }
        }
    }
}
