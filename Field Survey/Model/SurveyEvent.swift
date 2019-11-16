//
//  SurveyEvent.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import Foundation

struct SurveyEvent{
    let classification: Classification
    let title: String
    let description: String
    let date: Date
    
    init(classification: Classification, title: String, description: String, date: Date) {
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    
    init?(className: String, title: String, description: String, date: Date){
        if let classification = Classification(rawValue: className){
            self.init(classification: classification, title: title, description: description, date: date)
        }
        else{
            return nil
        }
    }
}
