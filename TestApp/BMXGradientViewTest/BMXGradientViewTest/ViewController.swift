//
//  ViewController.swift
//  BMXGradientViewTest
//
//  Created by Massimiliano Bigatti on 21/07/14.
//  Copyright (c) 2014 Massimiliano Bigatti. All rights reserved.
//

import UIKit
import BMXGradientView

class ViewController: UITableViewController {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel!.text = "Cell #\(indexPath.row)"

        cell.backgroundView = GradientView(frame: cell.bounds)
        cell.backgroundView!.backgroundColor = UIColor.orangeColor()
        
        return cell
    }

}

