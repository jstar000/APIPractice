//
//  ApiResource.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/11.
//

import Alamofire
import Foundation
import OrderedCollections

public class ApiResource {
    var parameterMap: OrderedDictionary<String, String> = [:]
    
    func backgroundTask(completionHandler: @escaping (OrderedDictionary<String, String>) -> ()) {
        
        let url = "https://kuis.konkuk.ac.kr/ui/cpr-lib/user-modules.js?p=0.5057405759389186"
        let header: HTTPHeaders = ["Connection": "close"] // connection이 keep-alive가 아니라 close?
        
        let request = AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200 ..< 300)
            .responseString { [self] response in
                switch response.result {
                case .success(let data):
                    let regex = try! NSRegularExpression(pattern: #"submit\.addParameter\("(.*?)","(.*?)"\);"#)
                    let matches = regex.matches(in: data, range: NSRange(data.startIndex..., in: data))
                    
                    for match in matches {
                        if let keyRange = Range(match.range(at: 1), in: data),
                           let valueRange = Range(match.range(at: 2), in: data)
                        {
                            let key = String(data[keyRange])
                            let value = String(data[valueRange])
                            
                            // 쓸모없는 부분이 저장되는 것을 막습니다.
                            if parameterMap.count < 10 {
                                // parameters에 key, value 저장
                                parameterMap[key] = value
                            }
                        }
                    }
                    completionHandler(parameterMap)
//                    for (key, value) in ApiResource.parameterMap {
//                        print(key + " " + value)
//                    }
                    
                case .failure(let err):
                    print("RESPONSE CODE:", response.response?.statusCode ?? 0)
                    print("ERROR: ", err.localizedDescription)
                }
            }
    }
}
    
