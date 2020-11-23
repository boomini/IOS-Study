//
//  AppDelegate.swift
//  AppDelegate_Basic
//
//  Created by EMGRAM on 2020/11/23.
//

import UIKit
// app이 최초에 실행되서 활성화되는 부분에 가장 시작점을 캐치할 수 있는 부분이고 앱 자체가 내려가거나 종료되었을 때 캐치할 수 있는 부분.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
//앱이 가장 처음에 시작될 준비가 된 상태일 때, 실행되는 가장 최초의 func
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
//ios13버전으로 업그레이드되면서 windwos개념대신 scene이 생겼고
//ios12까지는 하나의 앱에 하나의 window였지만
//ios13부터는 윈도우의개념이 scene으로 대체되었다.
