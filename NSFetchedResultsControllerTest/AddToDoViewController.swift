//
//  AddToDoViewController.swift
//  NSFetchedResultsControllerTest
//
//  Created by Ilia Tikhomirov on 30/01/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let managedObjectContext: NSManagedObjectContext = (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext

    @IBAction func cancelDidTouch(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func saveDidTouch(sender: AnyObject) {
        
        let name = textField.text
        
        if let isEmpty = name?.isEmpty where isEmpty == false {
            // Create Entity
            let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: self.managedObjectContext)
            
            // Initialize Record
            let record = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.managedObjectContext)
            
            // Populate Record
            record.setValue(name, forKey: "name")
            
            let date = NSDate()
            
            //format date
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
            let dateString = dateFormatter.stringFromDate(date)
            print(dateString) //prints out 10:12
            
            record.setValue(dateString, forKey: "createdAt")
            
            do {
                // Save Record
                
                print("SAVED")
                try record.managedObjectContext?.save()
                
                // Dismiss View Controller
                dismissViewControllerAnimated(true, completion: nil)
                
            } catch {
                let saveError = error as NSError
                print("\(saveError), \(saveError.userInfo)")
                
                // Show Alert View
                showAlertWithTitle("Warning", message: "Your to-do could not be saved.", cancelButtonTitle: "OK")
            }
            
        } else {
            // Show Alert View
            showAlertWithTitle("Warning", message: "Your to-do needs a name.", cancelButtonTitle: "OK")
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func showAlertWithTitle(title: String, message: String, cancelButtonTitle: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .Default, handler: nil))
        
        // Present Alert Controller
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
