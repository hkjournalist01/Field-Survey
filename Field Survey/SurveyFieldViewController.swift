//
//  SurveyFieldViewController.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import UIKit

class SurveyFieldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    let surveyEvents = SurveyEventJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveyEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        if let cell = cell as? SurveyFieldTableViewCell{
            let surveyEvent = surveyEvents[indexPath.row]
            cell.iconImage.image = surveyEvent.classification.image
            cell.titleLabel.text = surveyEvent.title
            cell.dateLabel.text = dateFormatter.string(from: surveyEvent.date)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row{
            
            destination.surveyEvent = surveyEvents[row]
        }
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
