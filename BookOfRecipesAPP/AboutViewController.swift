//
//  AboutViewController.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 5/10/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var AboutLabel: UILabel!
    
    @IBOutlet weak var photo1: UIImageView!
    
    @IBOutlet weak var photo2: UIImageView!
    
    @IBOutlet weak var bio1: UITextView!
    
    @IBOutlet weak var bio2: UITextView!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AboutLabel.text = "The Developers"
        
        photo1.image = #imageLiteral(resourceName: "user3")
        name1.text = "Sergey C."
        bio1.text = "Sergey is currently taking the iOS Development course for Spring 2017 at De Anza College."
        
        photo2.image = #imageLiteral(resourceName: "user1")
        name2.text = "Rose L."
        bio2.text = "Rose is currently taking the iOS Development course for Spring 2017 at De Anza College.\n\nHer favorite dessert is creme brulee."
        
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
