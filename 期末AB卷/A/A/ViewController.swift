//
//  ViewController.swift
//  A
//
//  Created by student on 2024/12/26.
//

import UIKit
import MapKit
import UserNotifications

class ViewController: UIViewController {

    // info.plist需要NSLocationWhenInUseUsageDescription和NSLocationAlwaysAndWhenInUseUsageDescription
    // sceneDelegate中需要添加 UIApplication.shared.applicationIconBadgeNumber = 0
    // 出现无法定位的情况，检查模拟器设置中默认位置。Edit scheme ->  options -> default location
    
    @IBOutlet weak var mapview: MKMapView!
    // CLLocationManager实例，用于获取设备的位置信息
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 请求应用在后台和前台都能获取位置更新的权限
        locationManager.requestAlwaysAuthorization()
        // 设置地图视图的用户跟踪模式为.follow，即地图会随着用户位置的移动而自动移动
        mapview.userTrackingMode = .follow
        
        // 请求用户授权应用发送声音、警报和应用图标角标的通知
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert, .badge]) { (flag, error) in
            // 如果没有错误，并且用户授权了通知
            if error == nil, flag == true {
                print("用户允许通知") // 打印日志，表示用户授权成功
            } else {
                print("用户拒绝通知") // 打印日志，表示用户拒绝授权
            }
        }
        // 设置当前ViewController为UNUserNotificationCenter的代理，以便处理通知相关的事件
        UNUserNotificationCenter.current().delegate = self
    }
    
    // touchesBegan方法在用户触摸屏幕时调用，用于处理触摸事件
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // 创建一个可变的UNMutableNotificationContent实例，用于定义通知的内容
        let content = UNMutableNotificationContent()
        content.badge = 5 // 设置应用图标上的角标数量为5
        content.title = "附近景点有优惠政策了！" // 设置通知的标题
        content.subtitle = "点击通知了解详情" // 设置通知的副标题
        content.body = "凭学生证购票，享半价优惠。" // 设置通知的正文内容
        
        // 定义通知的触发条件,3s后触发
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3.0, repeats: false)
        // 定义一个通知请求
        let request = UNNotificationRequest.init(identifier: UUID().uuidString, content: content, trigger: trigger)
        // 在满足触发条件时发送通知
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

// 处理通知相关的事件
extension ViewController: UNUserNotificationCenterDelegate {
    // userNotificationCenter方法在通知即将展示给用户时调用
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 调用completionHandler，并传入UNNotificationPresentationOptions，决定如何展示通知
        completionHandler([.list, .banner, .sound])
    }
    
    // userNotificationCenter方法在用户响应通知（如点击通知）时调用
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 打印通知的具体内容，包括角标、标题、副标题和正文
        print(response.notification.request.content.badge)
        print(response.notification.request.content.title)
        print(response.notification.request.content.subtitle)
        print(response.notification.request.content.body)
        
        // 调用completionHandler，表示处理完成
        completionHandler()
    }
}
