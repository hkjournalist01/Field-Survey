//
//  ObservationViewController.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import UIKit

class ObservationViewController: UIViewController {
    
    var dateFormatter = DateFormatter()
    var surveyEvent: SurveyEvent?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        imageView.image = surveyEvent?.classification.image
        titleLabel.text = surveyEvent?.title
        descriptionText.text = surveyEvent?.description
        if let date = surveyEvent?.date{
            dateLabel.text = dateFormatter.string(from: date)
        }else{
            dateLabel.text = ""
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
