//
//  MyTableViewController.swift
//  BookOfRecipesAPP
//
//  Created by Sergey on 5/10/17.
//  Copyright © 2017 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    /*var Recipes = ["Cappuccino", "Chai Latte", "Lemon Iced Tea", "Homestyle Lemonade", "Berry Smoothie", "Strawberry Cheesecake", "Caramel Flan", "Blueberry Pie", "Chocolate Molten Lava Cake", "Vanilla Cream Puff", "Chili Con Carne", "New England Clam Chowder", "Garden Salad", "7-Layer Nachos", "Buffalo Wings", "Oven-baked Salmon", "Grilled Steak", "Grilled Pork Chop", "Spaghetti and Meatballs", "Cheeseburger"]
    
    var RecipesImages = [#imageLiteral(resourceName: "Coffe"), #imageLiteral(resourceName: "chai"), #imageLiteral(resourceName: "icedtea"), #imageLiteral(resourceName: "lemonade"), #imageLiteral(resourceName: "smoothie"), #imageLiteral(resourceName: "Cheesecake"), #imageLiteral(resourceName: "flan"), #imageLiteral(resourceName: "pie"), #imageLiteral(resourceName: "lavacake"), #imageLiteral(resourceName: "creampuff"), #imageLiteral(resourceName: "chili"), #imageLiteral(resourceName: "clamchowder"), #imageLiteral(resourceName: "salad"), #imageLiteral(resourceName: "nachos"), #imageLiteral(resourceName: "wings"), #imageLiteral(resourceName: "salmon"), #imageLiteral(resourceName: "steak"), #imageLiteral(resourceName: "porkchop"), #imageLiteral(resourceName: "spaghetti"), #imageLiteral(resourceName: "burger")]
    
    var FullDescription = [
        "Italian coffee drink that is traditionally prepared with double espresso, hot milk, and steamed milk foam.",
        "Black tea infused with cinnamon, clove, and other warming spices is combined with steamed milk and topped with foam.",
        "Green tea is blended with mint, lemongrass and lemon verbena and lemonade, then lightly sweetened and given a good shake.",
        "Simple and easy method for perfect lemonade every time! With simple syrup and fresh lemon juice.",
        "Strawberries, blueberries, and raspberries blend with low-fat vanilla yogurt.",
        "Fresh, sweet strawberries and creamy cheesecake are layered on top of a rich graham cracker crust.",
        "This flan is made with condensed and evaporated milk and baked in a pie dish.",
        "An easy blueberry pie recipe with warm spices, lemon and a lattice crust.",
        "Molten chocolate cakes — also known as chocolate lava cakes — are rich individual chocolate cakes with oozing molten centers.",
        "An easy recipe for light and airy pastries filled with whipped cream or pastry cream.",
        "Spicy stew containing chili peppers, meat, and often tomatoes and beans.",
        "Channel New England with this rich and warming one-pot clam chowder.",
        "If eating more salad is on your list, it just got easier! Make an easy Garden Salad with fresh veggies and an equally simple, tasty salad dressing.",
        "Blend taco seasoning mix and refried beans. Spread the mixture onto a large serving platter. Mix the sour cream and cream cheese in a medium bowl. Spread over the refried beans. Top the layers with salsa.",
        "Baked buffalo wings! Chicken wings marinated in a spicy sauce, broiled, served with a tangy delicious blue cheese sauce.",
        "Season salmon with a little salt and pepper, and place skin-side down in a lightly greased baking dish or sheet pan; then bake in the oven at 400 degrees F for about 12 to 15 minutes. No need to flip the fish.",
        "Place the steaks on the grill and cook until golden brown and slightly charred, 4 to 5 minutes. Turn the steaks over and continue to grill 3 to 5 minutes for medium-rare.",
        "A simple marinade with soy sauce and lemon pepper seasoning add flavor to these pork chops meant to be grilled.",
        "Spaghetti with meatballs is an Italian-American dish that usually consists of spaghetti, tomato sauce and meatballs.",
        "A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty, but the burger can include many variations in structure, ingredients, and composition.",]
    
    var MyRecipe = [
        RecipeObject (iRecipe: "Cappuccino", iRecipeImage: #imageLiteral(resourceName: "Coffe"), iFullDescription: "Italian coffee drink that is traditionally prepared with double espresso, hot milk, and steamed milk foam."),
        RecipeObject (iRecipe: "Chai Latte", iRecipeImage: #imageLiteral(resourceName: "chai"), iFullDescription: "Black tea infused with cinnamon, clove, and other warming spices is combined with steamed milk and topped with foam."),
        RecipeObject (iRecipe: "Lemon Iced Tea", iRecipeImage: #imageLiteral(resourceName: "icedtea"), iFullDescription: "Green tea is blended with mint, lemongrass and lemon verbena and lemonade, then lightly sweetened and given a good shake."),
        RecipeObject (iRecipe: "Homestyle Lemonade", iRecipeImage: #imageLiteral(resourceName: "lemonade"), iFullDescription: "Simple and easy method for perfect lemonade every time! With simple syrup and fresh lemon juice.")]*/
    
    var MyRecipe : [RecipeObjectMO] = []
    var searchController : UISearchController!
    var searchResults : [RecipeObjectMO] = []
    var fetchResultsController : NSFetchedResultsController<RecipeObjectMO>!
    
   /* override var prefersStatusBarHidden: Bool {
        return true
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
        
        let fetchRequest : NSFetchRequest<RecipeObjectMO> = RecipeObjectMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "iRecipe", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
            
            do {
                try fetchResultsController.performFetch()
                if let fetchedObjects = fetchResultsController.fetchedObjects {
                    MyRecipe = fetchedObjects
                }
            }
            catch {
                print(error)
            }
            
            }
        
        tableView.backgroundColor = UIColor( red: 108.0/255.0, green: 122.0/255.0, blue: 137.0/255.0, alpha: 1.0)
        tableView.tableFooterView = UIView( frame: CGRect.zero)
        tableView.separatorColor = UIColor.clear
        
        searchController.searchBar.placeholder = "Search recipes..."
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor( red: 218.0/255.0, green: 100.0/255.0, blue: 70.0/255.0, alpha: 1.0)
        
        

        }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            MyRecipe = fetchedObjects as! [RecipeObjectMO]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return Recipes.count
        if searchController.isActive {
            return searchResults.count
        }
        else {
        return MyRecipe.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RecipesCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
        
        var cellItem : RecipeObjectMO
        
        if searchController.isActive {
            cellItem = searchResults[indexPath.row]
        }
        else {
            cellItem = MyRecipe[indexPath.row]
        }
        // Configure the cell...
        
        cell.cellLabel?.text = cellItem.iRecipe
        cell.cellImage?.image = UIImage(data: cellItem.iRecipeImage as! Data)
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if searchController.isActive {
            return false
        }
        else{
            return true
        }
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           
            //MyRecipe.remove(at: indexPath.row)
                    
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context  = appDelegate.persistentContainer.viewContext
                let itemToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(itemToDelete)
                appDelegate.saveContext()
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! MyDetailViewController
                detailVC.DetailRecipe = searchController.isActive ? searchResults[indexPath.row] : MyRecipe[indexPath.row]
            }
        }
        /*else if  segue.identifier == "AddNewRecipe" {
            let addVC = segue.destination as! AddViewController
            addVC.newRecipe = addData
        }*/
    }
    
    func addData(newItem : RecipeObjectMO){
        MyRecipe.append(newItem)
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = MyRecipe.filter({(RecipeItem : RecipeObjectMO) -> Bool in
            let nameMatch = RecipeItem.iRecipe?.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let textToSearch = searchController.searchBar.text {
            filterContentForSearchText(searchText: textToSearch)
            tableView.reloadData()
        }
    }
    

}
