//
//  MealCell.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
