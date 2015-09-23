//
//  InterfaceController.swift
//  PickerListApp WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myPicker: WKInterfacePicker!
    @IBOutlet var itemLabel: WKInterfaceLabel!

    var itemList: [(String, String)] = [
        ("Item 1", "Red"),
        ("Item 2", "Green"),
        ("Item 3", "Blue"),
        ("Item 4", "Yellow"),
        ("Item 5", "Indigo"),
        ("Item 6", "Violet") ]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        myPicker.setItems(pickerItems)

    }

    @IBAction func pickerChanged(value: Int) {
        itemLabel.setText(itemList[value].1)
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
