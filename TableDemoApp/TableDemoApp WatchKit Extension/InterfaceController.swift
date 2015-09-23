//
//  InterfaceController.swift
//  TableDemoApp WatchKit Extension
//
//  Created by Neil Smyth on 8/18/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myTable: WKInterfaceTable!

    let stringData = ["Warm-up", "Cardio", "Weightlifting", "Core", "Bike", "Cooldown"]

    let imageData = ["walking", "treadmill", "weights", "core", "bikeriding", "cooldown"]

    let detailData = ["Walk at a moderate pace for 20 minutes keeping heart rate below 110.",
        "Run for 30 minutes keeping heart rate between 130 and 140.",
        "Perform 3 sets of 10 repetitions increasing weight by 5lb on each set.",
        "Perform 2 sets of 20 crunches.",
        "Ride bike at moderate pace for 20 minutes.",
        "Walk for 10 minutes then stretch for 5 minutes."]


    func loadTable() {
        myTable.setRowTypes(["MyTitleRowController",
            "MyRowController",
            "MyRowController",
            "MyRowController",
            "MyRowController",
            "MyRowController",
            "MyRowController"])

        let titleRow = myTable.rowControllerAtIndex(0) 
            as! MyTitleRowController

        titleRow.titleLabel.setText("Workout Plan")

        for index in 0..<stringData.count {
            let row = myTable.rowControllerAtIndex(index+1) 
                as! MyRowController
            row.myLabel.setText(stringData[index])
            row.myImage.setImage(UIImage(named: imageData[index]))
        }

    }

    override init() {
        super.init()
        loadTable()
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        pushControllerWithName("DetailInterfaceController", 
             context: detailData[rowIndex-1])
    }

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
