//
//  RecipeDetailViewController.swift
//  BrewBook
//
//  Created by Andrew Kettel on 4/7/15.
//  Copyright (c) 2015 ParthenonSoftwareGroup. All rights reserved.
//

import UIKit
import CoreData

class RecipeDetailViewController: UIViewController {
    
    var detailItem : NSManagedObject! = nil
    
    @IBOutlet weak var recipeName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeName!.text = detailItem.valueForKey("name")!.description
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        detailItem.setValue(recipeName!.text, forKey:"name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
