//
//  HippoAnalyticsClient+EventLogging.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import HippoAnalytics

extension HippoAnalyticsClient: EventLogging {

    func log(name: String, properties: [String : Any]) {
        logEvent(named: name, properties: properties)
    }
}
