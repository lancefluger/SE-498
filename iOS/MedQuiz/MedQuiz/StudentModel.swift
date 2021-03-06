//
// Created by Harnack, Paul (Student) on 2/27/18.
// Copyright (c) 2018 Omar Sherief. All rights reserved.
//

import Foundation


class StudentModel {
    var userName:String
    var profilePic:String
    var friends:[StudentModel]
    var classes:[String:Bool]

    init(userName:String, profilePic:String, friends:[StudentModel], classes:[String:Bool]){
        self.userName = userName
        self.profilePic = profilePic
        self.friends = friends
        self.classes = classes
    }
}