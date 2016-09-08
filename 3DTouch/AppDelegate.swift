//
//  AppDelegate.swift
//  3DTouch
//
//  Created by xqzh on 16/9/7.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    let addIcon   = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Add)
    let alarmIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Alarm)
    let cloudIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Cloud)
    let bookMIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.Bookmark)
    // 创建一个标签，并配置相关属性。
    let addItem = UIApplicationShortcutItem(type: "a", localizedTitle: "添加", localizedSubtitle: "", icon: addIcon, userInfo: nil)
    let alarmItem = UIApplicationShortcutItem(type: "b", localizedTitle: "闹钟", localizedSubtitle: "", icon: alarmIcon, userInfo: nil)
    let cloudItem = UIApplicationShortcutItem(type: "c", localizedTitle: "cloud", localizedSubtitle: "", icon: cloudIcon, userInfo: nil)
    let booMItem = UIApplicationShortcutItem(type: "d", localizedTitle: "书签", localizedSubtitle: "", icon: bookMIcon, userInfo: nil)
    // 将标签添加进Application的shortcutItems中。
    UIApplication.sharedApplication().shortcutItems = [addItem, alarmItem, cloudItem, booMItem];
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
    print("\(shortcutItem.localizedTitle)")
    if shortcutItem.type == "b" {
      let tab = window!.rootViewController! as! UITabBarController
      // 判断：要推出的vc位于tabviewcontroller的哪一个tab
      if tab.selectedIndex != 0 {
        tab.selectedIndex = 0
      }
      
      let viewc = window!.rootViewController!.childViewControllers[0] as! UINavigationController
      if viewc.topViewController?.restorationIdentifier != "navi_vc_3d" {
        viewc.popViewControllerAnimated(false)
      }
      
      let story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
      let vc = story.instantiateViewControllerWithIdentifier("3d")
      
      if viewc.topViewController?.restorationIdentifier == "com.3dtouch.vc" {
        // 判断：如果栈顶控制器正是3D-Touch需要弹出的VC，不需要重新push
      }
      else if viewc.topViewController?.restorationIdentifier == "navi_vc_3d"{
        viewc.pushViewController(vc, animated: true)
      }
    }
    else if shortcutItem.type == "d" {
      let tab = window!.rootViewController! as! UITabBarController
      // 判断：要推出的vc位于tabviewcontroller的哪一个tab
      if tab.selectedIndex != 0 {
        tab.selectedIndex = 0
      }
      
      let viewc = window!.rootViewController!.childViewControllers[0] as! UINavigationController
      if viewc.topViewController?.restorationIdentifier != "navi_vc_3d" {
        viewc.popViewControllerAnimated(false)
      }
      
      let story = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
      let vc = story.instantiateViewControllerWithIdentifier("3d1")
      
      if viewc.topViewController?.restorationIdentifier == "3d1" {
        // 判断：如果栈顶控制器正是3D-Touch需要弹出的VC，不需要重新push
      }
      else if viewc.topViewController?.restorationIdentifier == "navi_vc_3d" {
        viewc.pushViewController(vc, animated: true)
      }
     
    }
    
    completionHandler(true)
  }


}

