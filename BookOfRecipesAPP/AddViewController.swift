//
//  AddViewController.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 6/3/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData


class AddViewController: UIViewController {
    
    @IBOutlet weak var addRecipe: UITextField!
    @IBOutlet weak var addImage: UITextField!
    @IBOutlet weak var addRecipeDescription: UITextView!
    
    var newRecipe : RecipeObjectMO!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedSave(_ sender: Any) {
        //newRecipe(RecipeObject(iRecipe: self.addRecipe.text!, iRecipeImage: UIImage(named: self.addImage.text!)!, iFullDescription: self.addRecipeDescription.text!))
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            newRecipe = RecipeObjectMO(context: appDelegate.persistentContainer.viewContext)
            
            newRecipe.iRecipe = addRecipe.text!
            newRecipe.iRecipeImage = NSData(data: UIImagePNGRepresentation(UIImage(named: addImage.text!)!)!)
            newRecipe.iFullDescription = addRecipeDescription.text!
            
            appDelegate.saveContext()
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
