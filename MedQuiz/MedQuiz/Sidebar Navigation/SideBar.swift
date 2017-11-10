//
//  NavTableViewController.swift
//  MedQuiz
//
//  Created by Maddy Transue on 11/7/17.
//  Copyright © 2017 Omar Sherief. All rights reserved.
//

import UIKit

class SideBar: UITableViewController {
    
    var QuizStoryboard:UIStoryboard? = nil
    var LeaderboardStoryboard:UIStoryboard? = nil
    var ProfileStoryboard:UIStoryboard? = nil
    var AboutStoryboard:UIStoryboard? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering the side bar nib to use in tableview
        let sideNavNib = UINib(nibName: "SideBarCell", bundle: nil)
        self.tableView.register(sideNavNib, forCellReuseIdentifier: "customSideCell")
        
        //Reference to the Quiz's storyboard
        QuizStoryboard = UIStoryboard(name: "QuizStoryboard", bundle: nil)
        
        //Reference to the Leaderboard's storyboard
        LeaderboardStoryboard = UIStoryboard(name: "LeaderboardStoryboard", bundle: nil)
        
        //Reference to the Profile's storyboard
        ProfileStoryboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
        
        //Reference to the About's storyboard
        AboutStoryboard = UIStoryboard(name: "AboutStoryboard", bundle: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aSideBarCell:SideBarCell = tableView.dequeueReusableCell(withIdentifier: "customSideCell", for: indexPath) as! SideBarCell
        if(indexPath.row == 0){
            aSideBarCell.navigateToPage.text = "Quiz"
        }
        else if(indexPath.row == 1){
            aSideBarCell.navigateToPage.text = "Leaderboard"
        }
        else if(indexPath.row == 2){
            aSideBarCell.navigateToPage.text = "Profile"
        }
        else if(indexPath.row == 3){
            aSideBarCell.navigateToPage.text = "About"
        }
        return aSideBarCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            splitViewController?.showDetailViewController(QuizStoryboard!.instantiateInitialViewController()!, sender: Any?.self)
        }
        else if(indexPath.row == 1){
            splitViewController?.showDetailViewController(LeaderboardStoryboard!.instantiateInitialViewController()!, sender: Any?.self)
        }
        else if(indexPath.row == 2){
            splitViewController?.showDetailViewController(ProfileStoryboard!.instantiateInitialViewController()!, sender: Any?.self)
        }
        else if(indexPath.row == 3){
            splitViewController?.showDetailViewController(AboutStoryboard!.instantiateInitialViewController()!, sender: Any?.self)
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}