//
//  RecipeTestCase.swift
//  BrewBook
//
//  Created by Andrew Kettel on 4/6/15.
//  Copyright (c) 2015 ParthenonSoftwareGroup. All rights reserved.
//

import CoreData
import UIKit
import XCTest
import BrewBook

class RecipeTestCase: CoreDataTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testThatWeCanCreateRecipe() {
        let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: managedObjectContext!)
        var recipe = Recipe(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        
        XCTAssertNotNil(recipe, "unable to create a recipe")
    }
    
    func testThatWeCanSetNameOfRecipe() {
        let name = "new name"
        let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: managedObjectContext!)
        var recipe = Recipe(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        recipe.name = name
        
        
        let fetchRequest = NSFetchRequest(entityName:"Recipe")
        var error: NSError?
        
        let fetchedResults = managedObjectContext!.executeFetchRequest(fetchRequest,
            error: &error) as! [NSManagedObject]?
        if let results = fetchedResults {
            let returnedRecipe = results[0]
            XCTAssertEqual(recipe, returnedRecipe, "returned recipe does not match")
        }
        else {
            XCTFail("fetchedResults is null")
        }
    }
}
