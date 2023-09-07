//
//  NoticeInfo.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/12.
//

import Foundation

public class NoticeInfo {
    private static var instance: NoticeInfo = NoticeInfo()
    
    private var notices: [Int: [Notice]] = [:]
    
    private init() {
        for i in 0..<7 {
            notices[i] = []
        }
    }
    
    public static func getInstance() -> NoticeInfo {
        return instance
    }
    
    public func setNoticeInfo(responseNotice: String, noticeCategory: String) {
        do {
//            if let noticeIndex = NoticeHandler.getIndex(key: noticeCategory) {
//                notices[noticeIndex]?.removeAll()
//
//                        if let responseNoticeData = responseNotice.data(using: .utf8),
//                           let responseNoticeJson = try JSONSerialization.jsonObject(with: responseNoticeData) as? [String: Any],
//                           let noticeJsonArray = responseNoticeJson["DS_LIST"] as? [[String: Any]] {
//
//                            for i in 0..<5 {
//                                let noticeJson = noticeJsonArray[i]
//
//                                if let articleId = noticeJson["ARTICLE_ID"] as? String,
//                                   let postedDate = noticeJson["POSTED_DT"] as? String,
//                                   let subject = noticeJson["SUBJECT"] as? String,
//                                   let link = NoticeHandler.getLink(noticeCategory, articleId) {
//
//                                    if let noticeIndex = NoticeHandler.getIndex(key: noticeCategory) {
//                                        let newNotice = Notice(postedDate: postedDate, subject: subject, articleId: articleId, link: link)
//                                        notices[noticeIndex]?.append(newNotice)
//                                    }
//                                }
//                            }
//                        }
//                    }
        }
        catch {
            
        }
    }
}
