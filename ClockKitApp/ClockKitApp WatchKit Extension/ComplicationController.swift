//
//  ComplicationController.swift
//  ClockKitApp WatchKit Extension
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    let timeLineText = ["Oatmeal Stout at Booth 212", "Porter at Booth 432", "Pale Ale at Booth 232", "English Bitter at Booth 327"]

    func createTimeLineEntry(headerText: String, bodyText: String, date: NSDate) -> CLKComplicationTimelineEntry {

        let template = CLKComplicationTemplateModularLargeStandardBody()
        let beerGlass = UIImage(named: "beer_glass")

        template.headerImageProvider = 
        CLKImageProvider(onePieceImage: beerGlass!)
        template.headerTextProvider = CLKSimpleTextProvider(text: headerText)
        template.body1TextProvider = CLKSimpleTextProvider(text: bodyText)

        let entry = CLKComplicationTimelineEntry(date: date, 
            complicationTemplate: template)

        return(entry)
    }

    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let currentDate = NSDate()
        handler(currentDate)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        let currentDate = NSDate()
        let endDate = 
             currentDate.dateByAddingTimeInterval(NSTimeInterval(4 * 60 * 60))

        handler(endDate)

    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        if complication.family == .ModularLarge {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm"

            let timeString = dateFormatter.stringFromDate(NSDate())

            let entry = createTimeLineEntry(timeString, bodyText: timeLineText[0], date: NSDate())

            handler(entry)
        } else {
            handler(nil)
        }

    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        var timeLineEntryArray = [CLKComplicationTimelineEntry]()
        var nextDate = NSDate(timeIntervalSinceNow: 1 * 60 * 60)

        for index in 1...3 {

            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm"

            let timeString = dateFormatter.stringFromDate(nextDate)

            let entry = createTimeLineEntry(timeString, bodyText: timeLineText[index], date: nextDate)

            timeLineEntryArray.append(entry)

            nextDate = nextDate.dateByAddingTimeInterval(1 * 60 * 60)
        }
        handler(timeLineEntryArray)

    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        let template = CLKComplicationTemplateModularLargeStandardBody()
        let beerGlass = UIImage(named: "beer_glass")

        template.headerImageProvider = CLKImageProvider(onePieceImage: beerGlass!)
            
        template.headerTextProvider =
         CLKSimpleTextProvider(text: "Beer Festival")
        template.body1TextProvider = 
            CLKSimpleTextProvider(text: "Beer Tasting Schedule")

        handler(template)

    }
    
}
