//
//  TrackingExpensesApp.swift
//  TrackingExpenses
//
//  Created by Влад on 10/10/23.
//

import SwiftUI
import Sentry


@main
struct TrackingExpensesApp: App {
    init() {
        SentrySDK.start { options in
            options.dsn = "https://caa6035e8cdaf9ca7c849d721bb88510@o4506027495981056.ingest.sentry.io/4506027506925568"
            options.debug = true // Enabled debug when first installing is always helpful
            options.enableTracing = true 

//             Uncomment the following lines to add more data to your events
//             options.attachScreenshot = true // This adds a screenshot to the error events
//             options.attachViewHierarchy = true // This adds the view hierarchy to the error events
        }
        // Remove the next line after confirming that your Sentry integration is working.
        SentrySDK.capture(message: "This app uses Sentry! :)")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
