//
//  ViewController.swift
//  Local_NotificationExample
//
//  Created by Sudhir Kumar on 9/21/15.
//  Copyright (c) 2015 Citibank. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    var indexValue = 0
    var locationManager: CLLocationManager!
    
    
//    -          Not just a new look, it’s a whole new way to bank. Visit our new branch @ 5 Ave & 52 St.
//    -          In a hurry?  You can save time by depositing checks, making transfers and much more at any Citibank ATM.
//    -          Our branch bankers love to meet and help our customers.  Ask a teller or the branch manager to introduce you.
    
    var msgArray = ["Our branch bankers love to meet and help our customers.  Ask a teller or the branch manager to introduce you."]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        UIApplication.sharedApplication().cancelAllLocalNotifications()
       
        var localNotification: UILocalNotification = UILocalNotification()
        
        var timeInterval:NSTimeInterval = 0.0
        for(var i : Int = 0 as Int; i < 1 ; i++){
           
        timeInterval = timeInterval + 5.0
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = msgArray[0]
        localNotification.fireDate = NSDate(timeIntervalSinceNow:timeInterval)
            
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        }
        
        
        
        
      // var istime = self.isBusinessHour()
        
        
        
        //http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo
        let downloader = Downloader("https://www.nsscreencast.com/api/episodes.json")
        downloader.downloadJson() {
            (let jsonResponse) in
            
            if jsonResponse == "ERROR"{
                
            }else{
               println("Received \(jsonResponse)")
            }
            
        }
        
        while downloader.running {
            println("waiting...")
            sleep(1)
        }
        
    }
    
    
    
    func isBusinessHour() -> Bool
    {
        let date = NSDate();
         NSLog("date:  \(date)")
        
        let dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateFormat = "hh mm a"
        dateFormatter.dateFormat = "EEEE, h a"
        //To prevent displaying either date or time, set the desired style to NoStyle.
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle //Set time style
        
        let nowTime = dateFormatter.stringFromDate(date)
        NSLog("now time is:  \(nowTime)")  //like str 5:34 PM
        
        // alternative: not case sensitive
        if nowTime.lowercaseString.rangeOfString("am") != nil || nowTime.lowercaseString.rangeOfString("pm") != nil{
            println("am/pm exists")
        }else{
            println("not am/pm exists")
        }
        
        //get day of the week of today
        //  let dateFormatter = NSDateFormatter()
       
        let dayOfWeekString = dateFormatter.stringFromDate(NSDate())
        
        NSLog("today is:  \(dayOfWeekString)")
        
        
//        let calendar = NSCalendar.currentCalendar()
//        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitWeekday, fromDate: date)
//        let hour = components.hour
//        let minutes = components.minute
//        let weekday = components.weekday
//        
//        
//        
//        NSLog("hour = %d min = %d weekday = %d",hour,minutes,weekday)
        
        /*
        if(branchHourDict.count == 0)
        {
            MFLog("isBusinessHour, error in reading ATM hours from gimbal manager")
            return true
        }
        
        var opentime : String = ""
        if let temp = branchHourDict[dayOfWeekString]
        {
            opentime = temp.first!
        }
        // var opentime : String = branchHourDict[dayOfWeekString]!.first!
        
        if(opentime == "closed")
        {
            NSLog("ATM branch closed, not business hour")
            return false
        }
        
        //branch open time
        var opentimeArr = opentime.componentsSeparatedByString(":")
        var opentime_hour = ""
        var opentime_min = ""
        if(opentimeArr.count == 2)
        {
            
            opentime_hour = opentimeArr[0]
            
            var min = opentimeArr[1]
            
            if let range = min.rangeOfString("_") {
                opentime_min = min[min.startIndex..<range.startIndex]
                
            }
            
        }
        //branch close time
        var closetime : String = ""
        if let temp2 = branchHourDict[dayOfWeekString]
        {
            closetime = temp2.last!
        }
        
        var closetimeArr = closetime.componentsSeparatedByString(":")
        
        
        var closetime_hour = ""
        var closetime_min = ""
        if(closetimeArr.count == 2)
        {
            closetime_hour = closetimeArr[0]
            //println("\(closetimeArr[1])")
            var min = closetimeArr[1]
            
            if let range = min.rangeOfString("_") {
                closetime_min = min[min.startIndex..<range.startIndex]
                //  println(closetime_min)
            }
            
        }
        
        //getting current time, format as 5:34 PM
        var nowTimeArr1 = nowTime.componentsSeparatedByString(" ")
        if( nowTimeArr1.count != 2 )
        {
            return true
        }
        
        var nowtime_hour = ""
        var nowtime_hourInt : Int!
        var nowtimeArr = nowTimeArr1[0]
        var nowtimeArr2 = nowtimeArr.componentsSeparatedByString(":")
        nowtime_hour = nowtimeArr2[0]
        if (nowTime.lowercaseString.rangeOfString("pm") != nil && nowtime_hour.toInt() < 12)
        {
            nowtime_hourInt = nowtime_hour.toInt()! + 12
        }
        else
        {
            nowtime_hourInt = nowtime_hour.toInt()
        }
        var nowtime_min : String = nowtimeArr2[1]
        
        //checking business hour
        if(nowtime_hourInt < opentime_hour.toInt())
        {
            return false
        }
        else if(nowtime_hourInt > closetime_hour.toInt())
        {
            return false
        }
            
        else if (nowtime_hourInt == opentime_hour.toInt() && nowtime_min.toInt() < opentime_min.toInt())
        {
            return false
        }
        else if(nowtime_hourInt == closetime_hour.toInt() && nowtime_min.toInt() > closetime_min.toInt())
        {
            return false
        }
        return true
        
        */
        return true
    }
    
    func localNotificationCall()
    {
        NSLog("hello World")
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

