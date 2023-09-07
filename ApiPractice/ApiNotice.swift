////
////  ApiNotice.swift
////  ApiPractice
////
////  Created by 임지성 on 2023/08/09.
////
//
//import Foundation
//import Alamofire
//
//public class ApiNotice {
//    
//    let apiResource = ApiResource()
//    apiResource.backgroundTask { response in
//        
//    }
//    
//    func backgroundTask() {
//        //비동기 호출 시 callback 대신 async, await를 사용하면 됨
//        
//        let headers : HTTPHeaders = ["Host" : "kuis.konkuk.ac.kr",
//                       "Referer" : "https://kuis.konkuk.ac.kr/index.do",
//                       "User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36",
//                       "sec-ch-ua-platform" : "Windows",
//                       "Sec-Fetch-Mode" : "cors",
//                       "Sec-Fetch-Site" : "same-origin",
//                       "X-Requested-With" : "XMLHttpRequest",
//                       "Pragma" : "no-cache",
//                       "Sec-Fetch-Dest" : "empty",
//                       "Cache-Control" : "no-cache",
//                       "Content-Type" : "application/x-www-form-urlencoded; charset=UTF-8",
//                       "Accept-Language" : "en-US,en;q=0.9,ko-KR;q=0.8,ko;q=0.7",
//                       "Accept" : "*/*",
//                       "Connection" : "keep-alive",
//                       "Origin" : "https://kuis.konkuk.ac.kr"
//        ]
//        
//        for i in 0...6 {
//            var category: String? = NoticeHandler.getCategory(index: i)
//            
//            
//            AF.upload(multipartFormData: { (multipartFormData) in
//                for (key, value) in parameters {
//                    multipartFormData.append(Data(value.utf8), withName: key)
//                }
//                multipartFormData.append(Data(NoticeHandler.getNoticeId(index: i).utf8), withName: "@d1#forum_id")
//                multipartFormData.append(Data(NoticeHandler.getNoticeSubject(index: i).utf8), withName: "@d1#subject_code")
//                multipartFormData.append(Data("@d1#".utf8), withName: "@d#")
//                multipartFormData.append(Data("dmBoardNoticeParam".utf8), withName: "@d1#")
//                multipartFormData.append(Data("dm".utf8), withName: "@d1#tp")
//            }, to: "https://kuis.konkuk.ac.kr/CmmnOneStop/find.do", method: .post, headers: headers).responseString { response in
//                switch response.result {
//                case .success(let data):
//                    print(data)
//                case .failure(let err):
//                    print("")
//                }
//                
//            }
//        }
//    }
//}
//
////                multipartFormData.append(Data("#9e4ki".utf8), withName: "Oe2Ue")
////                multipartFormData.append(Data("e&*\biu".utf8), withName: "Le093")
////                multipartFormData.append(Data("W^_zie".utf8), withName: "AWeh_3")
////                multipartFormData.append(Data("_qw3e4".utf8), withName: "Hd,poi")
////                multipartFormData.append(Data("Ajd%md".utf8), withName: "EKf8_/")
////                multipartFormData.append(Data("ekmf3".utf8), withName: "WEh3m")
////                multipartFormData.append(Data("JDow871".utf8), withName: "rE\fje")
////                multipartFormData.append(Data("NuMoe6".utf8), withName: "JKGhe8")
////                multipartFormData.append(Data("ne+3|q".utf8), withName: "_)e7me")
////                multipartFormData.append(Data("Qnd@%1".utf8), withName: "3kd3Nj")
