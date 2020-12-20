//
//  AppDelegate.swift
//  KonkukTaxi
//
//  Created by JeongHwan Seok on 2020/12/20.
//
//앱 전체의 실행 흐름을 컨트롤하는 객체로서 앱이 처음 실행되거나 종료될때, 백그라운드 상태나 포그라운드 상태로 활성화 될 때 호출되는 메소드로 구성

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    //앱이 처음 실행될때, 필요한 시스템적 처리를 모두 끝내고 메인 화면을 표시하기 직전에 호출됩니다.
    //이 메소드에 작성된 내용이 모두 실행되고 main.storyboard에 구현한 내용들이 스크린에 표현됩니다.
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //usleep(1500000) //1.5초
        return true
    }

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

