//
//  MyApiPractice.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/13.
//

import Alamofire
import Foundation
import OrderedCollections

class MyApiPractice {
    var pMap: OrderedDictionary<String, String> = [:]
    
    func getData() {
        
        backgroundTask { data in
            self.pMap = data
            
            for (key, value) in self.pMap {
                print("getData: " + key + " " + value)
            }
            
            let headers: HTTPHeaders = ["Host": "kuis.konkuk.ac.kr",
                                        "Referer": "https://kuis.konkuk.ac.kr/index.do",
                                        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36",
                                        "sec-ch-ua-platform": "Windows",
                                        "Sec-Fetch-Mode": "cors",
                                        "Sec-Fetch-Site": "same-origin",
                                        "X-Requested-With": "XMLHttpRequest",
                                        "Pragma": "no-cache",
                                        "Sec-Fetch-Dest": "empty",
                                        "Cache-Control": "no-cache",
                                        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                                        "Accept-Language": "en-US,en;q=0.9,ko-KR;q=0.8,ko;q=0.7",
                                        "Accept": "*/*",
                                        "Connection": "keep-alive",
                                        "Origin": "https://kuis.konkuk.ac.kr"]

            for i in 0 ... 6 {
                print("for문 ", i)
                AF.upload(multipartFormData: { multipartFormData in
                    for (key, value) in self.pMap {
                        multipartFormData.append(Data(value.utf8), withName: key)
                    }
                    multipartFormData.append(Data(NoticeHandler.getNoticeId(index: i).utf8), withName: "@d1#forum_id")
                    multipartFormData.append(Data(NoticeHandler.getNoticeSubject(index: i).utf8), withName: "@d1#subject_code")
                    multipartFormData.append(Data("@d1#".utf8), withName: "@d#")
                    multipartFormData.append(Data("dmBoardNoticeParam".utf8), withName: "@d1#")
                    multipartFormData.append(Data("dm".utf8), withName: "@d1#tp")
                }, to: "https://kuis.konkuk.ac.kr/CmmnOneStop/find.do", method: .post, headers: headers).responseString { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                    case .failure(let err):
                        print(err)
                    }
                }
            }
        }
    }
    
    func backgroundTask(completionHandler: @escaping (OrderedDictionary<String, String>) -> ()) {
        let url = "https://kuis.konkuk.ac.kr/ui/cpr-lib/user-modules.js?p=0.5057405759389186"
        let header: HTTPHeaders = ["Connection": "close"] // connection이 keep-alive가 아니라 close?
        
        let request = AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200 ..< 300)
            .responseString { response in
                switch response.result {
                case .success(let data):
                    let regex = try! NSRegularExpression(pattern: #"submit\.addParameter\("(.*?)","(.*?)"\);"#)
                    let matches = regex.matches(in: data, range: NSRange(data.startIndex..., in: data))
                    
                    var temp: OrderedDictionary<String, String> = [:]
                    
                    for match in matches {
                        if let keyRange = Range(match.range(at: 1), in: data),
                           let valueRange = Range(match.range(at: 2), in: data)
                        {
                            let key = String(data[keyRange])
                            let value = String(data[valueRange])
                            
                            // 쓸모없는 부분이 저장되는 것을 막습니다.
                            if temp.count < 10 {
                                // parameters에 key, value 저장
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
