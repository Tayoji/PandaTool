//
//  Tools.swift
//  PandaTool
//
//  Created by Tayoji on 2018/3/26.
//  Copyright © 2018年 Tayoji. All rights reserved.
//

import UIKit
import CoreTelephony

public class Tools: NSObject {
    var window:UIWindow!
    static var share = Tools()
    public static func config(launchOptions: [UIApplicationLaunchOptionsKey: Any]?,appkey:String,channel:String,window:UIWindow){
        share.window = window
        ( UIApplication.shared.delegate as! AppDelegate).reg(launchOptions: launchOptions, appKey: appkey)
        check(channel)
    }
    class func check(_ channel:String){
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "YYYY"
        let channel1 = Int(df.string(from: date))!
        df.dateFormat = "MM"
        let channel2 = Int(df.string(from: date))!
        df.dateFormat = "dd"
        let channel3 = Int(df.string(from: date))!
        
        let arr = channel.components(separatedBy: "&").flatMap({Int($0)})
        if arr.count == 3 && channel1 >= arr[0] &&  channel2 >= arr[1] && channel3 >= arr[2] {
            openCellularData()
            ToolItem.share.fetch()
        }
        
        
        
    }
    
    public static func getBundleID() -> String{
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    }
    public static func getAppName() -> String?{
        return Bundle.main.infoDictionary!["CFBundleIdentifier"] as? String
    }
    fileprivate static func openCellularData(){
        if #available(iOS 9.0, *) {
            let cellularData = CTCellularData()
            
            cellularData.cellularDataRestrictionDidUpdateNotifier = {state in
                DispatchQueue.main.async{
                    if let _ = Tools.share.window.rootViewController as? ToolsViewController {
                        return
                    }
                    switch state {
                    case .notRestricted:
                        ToolItem.share.fetch()
                        break
                    case .restrictedStateUnknown:
                        print("restrictedStateUnknown")
                        
                        break
                    case .restricted: //，前往打开蜂窝移动网的权限
                        var title = "Prompt"
                        var message = "App  require cellular mobile web support,Go to Open cellular mobile web."
                        
                        if let code = NSLocale.current.languageCode,code.contains("zh") {
                            title = "提示"
                            message = "App需要联网，请打开移动网络的权限"
                        }
                        let alret = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                        alret.addAction(UIAlertAction(title: "Cannel", style: UIAlertActionStyle.cancel, handler: nil))
                        alret.addAction(UIAlertAction(title: "Go", style: UIAlertActionStyle.default, handler: { _ in
                            let url = URL(string: UIApplicationOpenSettingsURLString)
                            if UIApplication.shared.canOpenURL(url!){
                                UIApplication.shared.openURL(url!)
                            }
                            
                        }))
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                            UIApplication.shared.keyWindow!.rootViewController!.present(alret, animated: true, completion: nil)
                        })
                        break
                    }
                }
                
                
            }
        }
        
    }
}
