//
//  ViewController.swift
//  Q_Gesture
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(move))
        left.direction = .left
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(move))
        right.direction = .right
        
        let up = UISwipeGestureRecognizer(target: self, action: #selector(move))
        up.direction = .up
        
        let down = UISwipeGestureRecognizer(target: self, action: #selector(move))
        down.direction = .down
        
        
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
        self.view.addGestureRecognizer(up)
        self.view.addGestureRecognizer(down)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(move))
        self.view.addGestureRecognizer(tap)
    }

    @objc func move(sender: UIGestureRecognizer){
        
        if sender is UITapGestureRecognizer{
            centerY.constant = 0
            centerX.constant = 0
            
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
        }
        if let swipe = sender as? UISwipeGestureRecognizer{
            switch swipe.direction{
            case UISwipeGestureRecognizer.Direction.up:
                centerY.constant = centerY.constant - 50
            case .down:
                centerY.constant = centerY.constant + 50
            case .left:
                centerX.constant = centerX.constant - 50
            case.right:
                centerX.constant = centerX.constant + 50
            default:
                break
            }
            
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
            //뚝뚝끊기게 가는거 애니메이션 효과주기
            //0.3초 시간에 나눠서 작동이 된다.
        }
        
    }

}

