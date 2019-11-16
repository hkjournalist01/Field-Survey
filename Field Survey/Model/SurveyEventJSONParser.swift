//
//  SurveyEventJSONParser.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import Foundation

class SurveyEventJSONParser{
    static let dateFormatter = ISO8601DateFormatter()
    
    class func parse(_ data: Data) -> [SurveyEvent]{
        var surveyEvents = [SurveyEvent]()
        //dateFormatter.dateFormat = "YYYY-MM-ddTHH:mm:ssZ"
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok"{
            if let observations = root["observations"] as? [Any]{
                for observation in observations{
                    if let observation = observation as? [String: String]{
                        if let classification = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString){
                            if let surveyEvent = SurveyEvent(className: classification, title: title, description: description, date: date){
                                surveyEvents.append(surveyEvent)
                            }
                        }
                    }
                }
            }
        }
        
        return surveyEvents
    }
}
