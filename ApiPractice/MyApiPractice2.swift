//
//  MyApiPractice2.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/16.
//

import Alamofire
import Foundation

class MyApiPractice2 {
    
    func getData() {
        backgroundTask { data in
            var pMap: [String: String] = [:]
            pMap = data
            
            let parameters: [String: String] = [
                "@d1#forum_id": "notice",
                "@d1#subject_code": "0000300001",
                "@d#": "@d1#",
                "@d1#": "dmBoardNoticeParam",
                "@d1#tp": "dm",
            ]
            
            parameters.forEach { key, value in
                pMap[key] = value
            }
            print(pMap)
            

            let headers: HTTPHeaders = [
                "Accept": "*/*",
                "Accept-Encoding": "gzip, deflate, br",
                "Accept-Language": "ko-KR,ko;q=0.9",
                "Connection": "keep-alive",
                "Content-Length": "283",
                "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                "Cookie": "JSESSIONID=0001OAO6CDr_o9V9L1k_4euD1Up:1K8MR5RCIT; WMONID=RzAxxhojRTH",
                "Host": "kuis.konkuk.ac.kr",
                "Origin": "https://kuis.konkuk.ac.kr",
                "Referer": "https://kuis.konkuk.ac.kr/index.do",
                "Cache-Control": "no-cache",
                "Sec-Ch-Ua": "\"Not/A)Brand\";v=\"99\", \"Google Chrome\";v=\"115\", \"Chromium\";v=\"115\"",
                "Sec-Ch-Ua-Mobile": "?0",
                "Pragma": "no-cache",
                "Sec-Ch-Ua-Platform": "macOs",
                "Sec-Fetch-Dest": "empty",
                "Sec-Fetch-Mode": "cors",
                "Sec-Fetch-Site": "same-origin",
                "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5.2 Safari/605.1.15",
                "X-Requested-With": "XMLHttpRequest"
            ]
            
//            let headers: HTTPHeaders = ["Host": "kuis.konkuk.ac.kr",
//                                        "Referer": "https://kuis.konkuk.ac.kr/index.do",
//                                        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36",
//                                        "Sec-Ch-Ua-Platform": "macOS",
//                                        "Sec-Fetch-Mode": "cors",
//                                        "Sec-Fetch-Site": "same-origin",
//                                        "X-Requested-With": "XMLHttpRequest",
//                                        "Sec-Fetch-Dest": "empty",
//                                        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//                                        "Accept-Language": "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7",
//                                        "Accept": "*/*",
//                                        "Connection": "keep-alive",
//                                        "Origin": "https://kuis.konkuk.ac.kr"]
            
            AF.request("https://kuis.konkuk.ac.kr/CmmnOneStop/find.do", method: .post, parameters: pMap, encoding: URLEncoding.default, headers: headers)
                .responseString { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                    case .failure(let error):
                        print("RESPONSE CODE:", response.response?.statusCode ?? 0)
                        print("ERROR: ", error.localizedDescription)
                    }
                }
        }
    }
    
    func backgroundTask(completionHandler: @escaping ([String: String]) -> ()) {
        let url = "https://kuis.konkuk.ac.kr/ui/cpr-lib/user-modules.js?p=0.5057405759389186"
            
        AF.request(url, method: .get)
            .validate(statusCode: 200 ..< 300)
            .responseString { response in
                switch response.result {
                case .success(let data):
                    let regex = try! NSRegularExpression(pattern: #"submit\.addParameter\("(.*?)","(.*?)"\);"#)
                    let matches = regex.matches(in: data, range: NSRange(data.startIndex..., in: data))
            
                    var temp: [String: String] = [:]
            
                    for match in matches {
                        if let keyRange = Range(match.range(at: 1), in: data),
                           let valueRange = Range(match.range(at: 2), in: data)
                        {
                            let key = String(data[keyRange])
                            let value = String(data[valueRange])
            
                            if temp.count < 10 {
                                temp[key] = value
                            }
                        }
                    }
                    completionHandler(temp)
                case .failure(let err):
                    print("RESPONSE CODE:", response.response?.statusCode ?? 0)
                    print("ERROR: ", err.localizedDescription)
                }
            }
    }
}
