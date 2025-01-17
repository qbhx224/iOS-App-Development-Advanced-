//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isChange = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // App信息
        // App名称，默认为项目名
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String
        // 展示名称，必须设置Display Name
        let appDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        // 版本号
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        // Build号
        let appBuildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

        // 设备信息
        // 设备名称：iPhone 12 Pro Max
        let deviceName = UIDevice.current.name
        // 系统名称：iOS
        let systemName = UIDevice.current.systemName
        // 系统版本：14.4
        let systemVersion = UIDevice.current.systemVersion
        // 设备类型：iPhone
        let localizedModel = UIDevice.current.localizedModel
        // 设备唯一标识：6840C502-EA6D-441A-8F9C-9DEBDD83C21B
        let deviceIdentifier = UIDevice.current.identifierForVendor?.uuidString ?? "Unknown"
        // 设备电量：-1.0
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel

        // 设备语言：["zh-Hans-CN", "en-US", "en"]
        let preferredLanguages = NSLocale.preferredLanguages

        // 打印信息
        print("App的名称：", appName ?? "Unknown")
        print("App的展示名称：", appDisplayName ?? "Unknown")
        print("App的版本：", appVersion ?? "Unknown")
        print("App的编译版本：", appBuildVersion ?? "Unknown")
        print("设备名称：", deviceName)
        print("设备系统：", systemName)
        print("设备系统版本：", systemVersion)
        print("设备类型：", localizedModel)
        print("设备唯一标识：", deviceIdentifier)
        print("设备电量：", batteryLevel)
        print("设备语言：", preferredLanguages)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isChange.toggle()
        
        if isChange {
            UIApplication.shared.setAlternateIconName("AppIconSecond", completionHandler: nil)
        } else {
            UIApplication.shared.setAlternateIconName(nil, completionHandler: nil)
        }
        
    }
}

