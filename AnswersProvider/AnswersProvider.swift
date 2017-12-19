//
//  AnswersProvider.swift
//  AnswersProvider
//
//  Created by Mario Hahn on 19.12.17.
//  Copyright © 2017 Mario Hahn. All rights reserved.
//

import Foundation
import AnalyticsProvider
import Fabric
import Crashlytics

struct AnswersProvider: AnalyticsProvider {
    
    init() {
        Fabric.with([Crashlytics.self])
    }
    
    func log(_ view: ViewType) {
        Answers.logContentView(withName: view.name, contentType: nil, contentId: nil, customAttributes: view.parameters)
    }
    
    func log(_ event: EventType) {
        Answers.logCustomEvent(withName: event.name, customAttributes: event.parameters)
    }
    
    func log(_ purchase: PurchaseType) {
        Answers.logPurchase(withPrice: NSDecimalNumber(value: purchase.price), currency: purchase.currency, success: NSNumber(value: purchase.success), itemName: nil, itemType: nil, itemId: nil, customAttributes: purchase.parameters)
    }
}
