//
//  AccountViewController.swift
//  OrganicBeauti
//
//  Created by user199800 on 11/28/21.
//  Copyright © 2021 user199800. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        userImageView.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
