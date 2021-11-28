//
//  ViewController.swift
//  OrganicBeauti
//
//  Created by user199800 on 11/27/21.
//  Copyright © 2021 user199800. All rights reserved.
//

import UIKit


struct HttpResponse:Codable{
    let status: Int
    let message: String
}

struct User:Codable{
    let username:String
    let password:String
    let id: Int
    
}

class ViewController: UIViewController {
     //step1
       let API_URL = "https://organicbeauti.herokuapp.com/users/authenticate?username=user1&password=user1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Login(_ sender: Any) {
                
        //Step2
        //Create URL Session
        let urlSession = URLSession(configuration: .default)
        let url = URL(string: API_URL)
        
        if let url = url{
            //Step3
            //Create URL session datatask instance
            
            let dataTask = urlSession.dataTask(with: url){ (data,response,error) in
                if let data  = data{
                    print(data)
                    
                    let jsonDecorder = JSONDecoder()
                    
                    do{
                        
                    
                    let readableData = try jsonDecorder.decode(HttpResponse.self, from: data)
                        print(readableData.status)
                        print(readableData.message)
                    }
                    catch{
                        print("Not able to decode.")
                    }
                }
            }
            //Step4
            //to Start work
            dataTask.resume()
        }
    }
    
}

