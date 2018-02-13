//
//  ViewController.swift
//  FBTest
//
//  Created by 장웅 on 2018. 2. 13..
//  Copyright © 2018년 장웅. All rights reserved.
//

import UIKit
import FirebaseAuth
import Toaster

class ViewController: BaseVC {
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    {
        didSet
        {
            self.loadingActivity = indicator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Auth.auth().addStateDidChangeListener(self.authStateListner)
    }
    
    func authStateListner(_ auth:Auth, _ user:User?)
    {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let listner:NSObjectProtocol = self.authStateListner as? NSObjectProtocol
        {
            Auth.auth().removeStateDidChangeListener(listner)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signup(_ sender: Any) {
        
        self.showLoading(true)
        
        if let pass = self.tfPass.text , let email = self.tfEmail.text
        {

            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                if error != nil
                {
                    //Error
                    Toast(text: error!.localizedDescription).show()
                }else
                {
                    
                }
            })
        }else
        {
            self.showLoading(false)
      
        }
        
    }
    

    @IBAction func signin(_ sender: Any) {
        self.showLoading(true)
        
        
        
        let cur = AccountInfo.current()
        
        if let pass = self.tfPass.text , let email = self.tfEmail.text
        {
            
            DispatchQueue.global(qos: .background).async
            {
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    if error != nil
                    {
                        //Error
                        Toast(text: error!.localizedDescription).show()
                    }else
                    {
                        let usr = user!
                        
                        
                    }
                })
            }
        }else
        {
            self.showLoading(false)
        }
    }
    
    
}

