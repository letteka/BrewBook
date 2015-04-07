//
//  FirstViewController.swift
//  BrewBook
//
//  Created by Andrew Kettel on 4/2/15.
//  Copyright (c) 2015 ParthenonSoftwareGroup. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!

        let entity =  NSEntityDescription.entityForName("Recipe",
            inManagedObjectContext:
            managedContext)
        
        let recipe: Recipe = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext) as! Recipe
        
        recipe.name = "blah"
        
        
        let fetchRequest = NSFetchRequest(entityName:"Recipe")
        
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest,
            error: &error) as! [NSManagedObject]?
        
        if let results = fetchedResults {
            let rec = results[0]
            println(rec)
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

