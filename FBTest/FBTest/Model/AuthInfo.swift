//
//  AuthInfo.swift
//  FBTest
//
//  Created by 장웅 on 2018. 2. 13..
//  Copyright © 2018년 장웅. All rights reserved.
//

import Foundation
import FirebaseAuth

struct AuthInfo
{
    var name:String?
    let email:String
    var token:String?
}

class AccountInfo{
    var myInfo:AuthInfo?
    var friends:[AuthInfo]?
    
    static var shared:AccountInfo?

    static func current()->AccountInfo
    {
        
        
        if shared == nil
        {
            shared = AccountInfo()
        }
        
        return shared!
    }
    
    init()
    {
        print("instance created")
    }
    
    
    
}
