//
//  ViewController.swift
//  TSET
//
//  Created by student on 2024/12/5.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    let handler = NotificationHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        //申请权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (flag, error) in
            if error == nil && flag {
                print("用户允许通知！")
            } else {
                print("用户拒绝通知")
            }
        }
        // 前台代理
        UNUserNotificationCenter.current().delegate = handler
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let content = UNMutableNotificationContent()
        content.badge = 3
        content.title = "考试提醒⏰"
//        content.subtitle = "副标题"
        content.body = "距离考试结束还有15分钟，请注意时间提交试卷！"
        
        //触发器
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5.0, repeats: false)
        //请求
        let request = UNNotificationRequest.init(identifier: "test", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    // 前台通知
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound])
    }
    
    //点击通知反应
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification.request.content.title)
        print(response.notification.request.content.body)
        print(response.notification.request.content.badge)
        
        completionHandler()
        
    }
}
