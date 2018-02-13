//
//  BaseVC.swift
//  FBTest
//
//  Created by 장웅 on 2018. 2. 13..
//  Copyright © 2018년 장웅. All rights reserved.
//

import UIKit


typealias defaultVoidFunc = ()->()


class BaseVC: UIViewController {

    var loadingActivity:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showLoading(_ on:Bool)
    {
        
        DispatchQueue.main.async {
         
            if let loading = self.loadingActivity
            {
                loading.hidesWhenStopped = true
                
                if on
                {
                    loading.startAnimating()
                }else
                {
                    loading.stopAnimating()
                }
                
            }

        }
    }

}
