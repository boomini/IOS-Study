//
//  RatingView.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit
protocol RatingViewDelegate {
    func ratingStatusChanged()
}
class RatingView: UIStackView {
    var isEditMode = false
    
    var delegate: RatingViewDelegate?
    private var ratingButtons: [UIButton] = []
    public var rating = 0{
        didSet{
            delegate?.ratingStatusChanged()
            updateButtonsSelectionState()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons(){
        self.spacing = 0
        
        
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        let highlightedStar = UIImage(named: "highlightedStar")
        
        for index in 0..<5{
            let button = UIButton()
            
            button.widthAnchor.constraint(equalToConstant: 30).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
             
            button.tag = index + 1
            button.addTarget(self, action: #selector(selectedStar), for: .touchUpInside)
            button.setImage(filledStar, for: .selected)
            button.setImage(emptyStar, for: .normal)
            button.setImage(highlightedStar, for: .highlighted)
            
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        }
    }
    
    @objc func selectedStar(sender: UIButton){
        print("selected star \(sender.tag)")
        guard self.isEditMode else{
            return
        }
        rating = sender.tag
    }
    
    func updateButtonsSelectionState(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < self.rating
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
