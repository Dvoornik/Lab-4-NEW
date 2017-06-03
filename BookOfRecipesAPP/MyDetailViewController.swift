//
//  MyDetailViewController.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 5/10/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class MyDetailViewController: UIViewController {

    @IBOutlet weak var RecipeLabel: UILabel!
    @IBOutlet weak var RecipeImage: UIImageView!
    @IBOutlet weak var RecipeDescription: UITextView!
    
    var LabelRecipeText: String!
    var LabelImage: UIImage!
    var LabelDescription: String!
    
    var DetailRecipe : RecipeObject!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
                
        self .RecipeLabel.text = self.DetailRecipe.iRecipe
        self .RecipeImage.image = self.DetailRecipe.iRecipeImage
        self .RecipeDescription.text = self.DetailRecipe.iFullDescription
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
