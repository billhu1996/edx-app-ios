//
//  UserPreference.swift
//  edX
//
//  Created by Kevin Kim on 7/28/16.
//  Copyright © 2016 edX. All rights reserved.
//

import Foundation
import edXCore

public class UserPreference {
    
    enum PreferenceKeys: String, RawStringExtractable {
        case PrefLang = "pref-lang"
        case TimeZone = "time_zone"
    }

    var timeZone: String?
    var prefLang: String?
    
    public init?(json: JSON) {
        prefLang = json[PreferenceKeys.PrefLang].string ?? ""
        timeZone = json[PreferenceKeys.TimeZone].string ?? "UTC"
        
        // Set all dates to convert to user time zone chosen on web platform
        NSTimeZone.setDefaultTimeZone(NSTimeZone(name: timeZone!)!)
    }
    
    internal init(prefLang: String? = nil, timeZone : String? = nil) {
        self.prefLang = prefLang
        self.timeZone = timeZone
    }
    
}
