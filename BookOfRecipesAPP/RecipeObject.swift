//
//  RecipeObject.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 6/3/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class RecipeObject: NSObject {
    
    var iRecipe = ""
    var iRecipeImage = UIImage(named: "")
    var iFullDescription = ""
    
    init(iRecipe: String, iRecipeImage: UIImage, iFullDescription: String){
        
        self.iRecipe = iRecipe
        self.iRecipeImage = iRecipeImage
        self.iFullDescription = iFullDescription
        
    }
}
