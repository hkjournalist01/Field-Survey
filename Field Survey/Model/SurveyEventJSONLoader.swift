//
//  SurveyEventJSONLoader.swift
//  Field Survey
//
//  Created by Yongyu Deng on 11/16/19.
//  Copyright © 2019 Yongyu Deng. All rights reserved.
//

import Foundation

class SurveyEventJSONLoader{
    class func load(fileName: String) -> [SurveyEvent]{
        var events = [SurveyEvent]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){

            events = SurveyEventJSONParser.parse(data)
        }
        
        
        return events
    }
}
