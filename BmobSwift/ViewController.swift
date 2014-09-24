//
//  ViewController.swift
//  BmobSwift
//
//  Created by Bmob on 14-8-6.
//  Copyright (c) 2014年 bmob. All rights reserved.
//

import UIKit
//import BmobObjectSub

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        saveObj()
//        queryObj()
        
        self.update()
        
//        var user:BmobUser = BmobUser.getCurrentUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func saveObj(){
        var obj:BmobObject = BmobObject(className: "GameScore")
        obj.setObject(3, forKey: "class")
        obj.saveInBackground()
    }
    
    func queryObj(){
        var query:BmobQuery = BmobQuery(className:"Post")
        query.includeKey("author")
        query.whereKeyExists("author")
        query.findObjectsInBackgroundWithBlock({array,error in
            for obj in array{
                if obj is BmobObject{
                    var obj2:BmobObject = obj.objectForKey("author") as BmobObject
                    var name:String   = obj2.objectForKey("username") as String
                    var classNumber:Int =  obj.objectForKey("class").integerValue
                    println("class is!   \(classNumber)")
                }
            }
            }
        )
    }
    
     func update(){
        var obj:BmobObject = BmobObject(withoutDatatWithClassName: "Post", objectId: "a1419df47a")
        obj.incrementKey("class", byAmount: 5)
        obj.updateInBackgroundWithResultBlock({isSuccessful,error in
            if error{
                println("error is : \(error.description)")
            }else{
                println("update Successful")
            }
        })
    }
    
    func delete(){
        var obj:BmobObject = BmobObject(withoutDatatWithClassName: "Post", objectId: "a1419df47a")
        obj.deleteInBackgroundWithBlock({isSuccessful,error in
            if error{
                println("error is : \(error.description)")
            }else{
                println("delete Successful")
            }
        })
    }
}

