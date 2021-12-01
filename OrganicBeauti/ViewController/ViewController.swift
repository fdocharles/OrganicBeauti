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
    //let data: User
}

struct User:Codable{
    let username:String
    let password:String
    let id: Int
    
}//rrtr

class ViewController: UIViewController {
     //step1
       let API_URL = "https://organicbeauti.herokuapp.com"
    
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var alertAction = UIAlertAction(title: "OK", style: .default, handler: {
        (action) -> Void in
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 7
        loginButton.layer.masksToBounds = true
        
        //Styles
        /*
         let bottomLine = CALayer()
        bottomLine.borderColor = UIColor(red: 100, green: 125, blue: 133, alpha: 255).cgColor
        
        bottomLine.frame = CGRect(x: 0.0, y: usernameTxt.frame.height - 1, width: usernameTxt.frame.width, height: 1.0)
        usernameTxt.borderStyle = UITextField.BorderStyle.none
        usernameTxt.layer.addSublayer(bottomLine)
        
        bottomLine.frame = CGRect(x: 0.0, y: passwordTxt.frame.height - 1, width: passwordTxt.frame.width, height: 1.0)
        passwordTxt.borderStyle = UITextField.BorderStyle.none
        passwordTxt.layer.addSublayer(bottomLine)
         */
        
        
        
        //Temp
        usernameTxt.text = "user1"
        passwordTxt.text = "user1"
    }

    @IBAction func Login(_ sender: Any) {
        let username = usernameTxt.text!
        let password = passwordTxt.text!
        
        
        
        if(ValidateLogin(username: username, password: password))
        {
            //Step2
            //Create URL Session
            let urlSession = URLSession(configuration: .default)
            let url = URL(string: "\(API_URL)/users/authenticate?username=\(username)&password=\(password)")
            print(url)
            
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
                            /*if(readableData.status == 200)
                            {
                                if(readableData.data.id != nil && readableData.data.id > 0)
                                {
                                    print("Valid user")
                                }
                                else
                                {
                                    let invalidCredentialsAlert = UIAlertController(title: "Alert", message: "Invalid username or password.", preferredStyle: .alert)
                                    invalidCredentialsAlert.addAction(self.alertAction)
                                    self.present(invalidCredentialsAlert, animated: true, completion: nil)
                                }
                            }
                            else
                            {
                                let serverErrorAlert = UIAlertController(title: "Error", message: "Server Error", preferredStyle: .alert)
                                serverErrorAlert.addAction(self.alertAction)
                                self.present(serverErrorAlert, animated: true, completion: nil)
                                
                            }*/
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
        else
        {
            let requiredCredentialsAlert = UIAlertController(title: "Alert", message: "Username and Password required.", preferredStyle: .alert)
            requiredCredentialsAlert.addAction(alertAction)
            self.present(requiredCredentialsAlert, animated: true, completion: nil)
        }
        
    }
    
    func ValidateLogin(username: String, password: String) -> Bool{
        if(username.isEmpty || password.isEmpty)
        {
            return false;
        }
        
        return true;
    }
    
}

