//
//  DeviceConfig.swift
//  KonkukTaxi
//
//  Created by JeongHwan Seok on 2020/12/20.
//

//디바이스의 네트워크 상태를 지니는 클래스를 하나 만들고 전역에서 쓸 수 있도록 싱글톤으로 객체 생성
//싱글톤 -> 해당 클래스의 인스턴스가 하나만 생성되는 것을 보증할 수 있는 디자인 패턴
//싱글턴 패턴(Singleton pattern)을 따르는 클래스는, 생성자가 여러 차례 호출되더라도 실제로 생성되는 객체는 하나이고 최초 생성 이후에 호출된 생성자는 최초의 생성자가 생성한 객체를 리턴한다. 이와 같은 디자인 유형을 싱글턴 패턴이라고 한다. 주로 공통된 객체를 여러 개 생성해서 사용하는 DBCP(DataBase Connection Pool)와 같은 상황에서 많이 사용

import Foundation
import SystemConfiguration


class DeviceManager {
    static let shared: DeviceManager = DeviceManager()
    
    var networkStatus: Bool {
        get {
            return checkDeviceNetworkStatus()
        }
    }
    
    private init() {  }
    
    private func checkDeviceNetworkStatus() -> Bool {
            print("Check to Device Natwork Status....")
            var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            
            var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
            if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
                return false
            }
            
            // Working for Cellular and WIFI
            let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
            let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
            let ret = (isReachable && !needsConnection)
            return ret
        }
}
