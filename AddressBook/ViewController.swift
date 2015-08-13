//
//  ViewController.swift
//  AddressBook
//
//  Created by Kadasiddha Kullolli on 13/08/15.
//  Copyright (c) 2015 Kadasiddha Kullolli. All rights reserved.
//

import UIKit
import AddressBookUI
import AddressBook

class ViewController: UIViewController,ABPeoplePickerNavigationControllerDelegate {
    
    let personPicker: ABPeoplePickerNavigationController
    
    required init(coder aDecoder: NSCoder) {
        personPicker = ABPeoplePickerNavigationController()
        super.init(coder: aDecoder)
        personPicker.peoplePickerDelegate = self
    }
    
    @IBAction func performPickPersonfromContactList(sender : AnyObject) {
        self.presentViewController(personPicker, animated: true, completion: nil)
    }
    
    func peoplePickerNavigationControllerDidCancel(
        peoplePicker: ABPeoplePickerNavigationController!){
            /* Mandatory to implement */
    }
    
    func peoplePickerNavigationController(
        peoplePicker: ABPeoplePickerNavigationController!,didSelectPerson person: ABRecordRef!) {
            
            /* Do we know which picker this is? */
            if peoplePicker != personPicker{
                return
            }
            
            let emails: ABMultiValueRef = ABRecordCopyValue(person,kABPersonEmailProperty).takeRetainedValue() as ABMultiValueRef
            
            let allEmails = ABMultiValueCopyArrayOfAllValues(emails).takeRetainedValue() as NSArray
            
            for email in allEmails{
                println(email)
            }
            
    }
    
}

