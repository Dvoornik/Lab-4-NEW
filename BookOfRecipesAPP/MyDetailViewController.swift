//
//  MyDetailViewController.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 5/10/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class MyDetailViewController: UIViewController {

    @IBOutlet weak var RecipeLabel: UILabel!
    @IBOutlet weak var RecipeImage: UIImageView!
    @IBOutlet weak var RecipeDescription: UITextView!
    
    var LabelRecipeText: String!
    var LabelImage: UIImage!
    var LabelDescription: String!
    
    var DetailRecipe : RecipeObjectMO!
    
    override var prefersStatusBarHidden: Bool {
        return false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self .RecipeImage.alpha = 0.0
        self .RecipeDescription.alpha = 0.0

        }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self .RecipeLabel.text = self.DetailRecipe.iRecipe
        self .RecipeImage.image = UIImage(data:self.DetailRecipe.iRecipeImage as! Data)
        self .RecipeDescription.text = self.DetailRecipe.iFullDescription
        
        self .RecipeLabel.center.x -= view.bounds.width

        
        UIView.animate(withDuration: 1.0, animations: {self.RecipeImage.alpha = 1.0; self.RecipeDescription.alpha = 1.0})
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseOut, animations: {
            self.RecipeLabel.center.x = self.view.center.x
        }, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
