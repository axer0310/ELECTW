//
//  ViewController.swift
//  ELECTW
//
//  Created by Arthur on 2018/5/30.
//  Copyright © 2018年 Arthur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentLoad: UIView!
    @IBOutlet var remainingLoad: UIView!
    var  data = [NSArray]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getData()
    {
        do
        {
            let file = try Data(contentsOf: URL(string: "http://data.taipower.com.tw/opendata01/apply/file/d006001/001.txt")!)
            let json = try JSONSerialization.jsonObject(with: file, options: .mutableLeaves) as! [String:Any]
            data = json["aaData"] as! [NSArray]
            
            var totalLoad = 0.0
            var currentLoad = 0.0
            
            
            for child in data as [NSArray]
            {
                if( (child[1] as! String) == "小計")
                {
                    let buffTotal = child[2] as! String
                    let buffCurrent = child[3] as! String
                    let totalNum = buffTotal.components(separatedBy: "(")[0]
                    let currentNum = buffCurrent.components(separatedBy: "(")[0]
                    totalLoad += ((Double)(totalNum))!
                    currentLoad += ((Double)(currentNum))!
                }
            }
            print(currentLoad)
            print(totalLoad)
        }
        catch
        {
            print(error)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

