//
//  NoticeHandler.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/09.
//

import Foundation
import OrderedCollections

public class NoticeHandler {
    
    private static var firstLink: OrderedDictionary<String, String> = NoticeHandler.createFirstLink()
    
    
    private static var categoryMap: OrderedDictionary<Int, String> = NoticeHandler.createCategoryMap()
    private static var indexMap: OrderedDictionary<String, Int> = NoticeHandler.createIndexMap()
 
    
    
    private static var noticeId: [String] = ["notice", "11688412", "11731332", "notice", "notice", "65659", "notice"]
    private static var noticeSubject: [String] = ["0000300001", "", "", "0000300002", "0000300003", "", "0000300006"];

    private static func createFirstLink() -> OrderedDictionary<String, String> {
        var dict: OrderedDictionary<String, String> = [:]
        
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=notice?&sort=6&id=", forKey: "학사")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=11688412?&sort=6&id=", forKey: "장학")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=11731332?&sort=6&id=", forKey: "취창업")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=notice?&sort=6&id=", forKey: "국제")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=notice?&sort=6&id=", forKey: "학생")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=65659?&sort=6&id=", forKey: "산학")
        dict.updateValue("http://www.konkuk.ac.kr/jsp/Plaza/plaza_01_01.jsp?src=http://www.konkuk.ac.kr:80/do/MessageBoard/ArticleRead.do?forum=notice?&sort=6&id=", forKey: "일반")
        
        return dict
    }
    
    private static func createCategoryMap() -> OrderedDictionary<Int, String> {
        var dict: OrderedDictionary<Int, String> = [:]
        
        dict.updateValue("학사", forKey: 0)
        dict.updateValue("장학", forKey: 1)
        dict.updateValue("취창업", forKey: 2)
        dict.updateValue("국제", forKey: 3)
        dict.updateValue("학생", forKey: 4)
        dict.updateValue("산학", forKey: 5)
        dict.updateValue("일반", forKey: 6)
        
        return dict
    }
    
    private static func createIndexMap() -> OrderedDictionary<String, Int> {
        var map: OrderedDictionary<String, Int> = [:]
        
        map.updateValue(0, forKey: "학사")
        map.updateValue(1, forKey: "장학")
        map.updateValue(2, forKey: "취창업")
        map.updateValue(3, forKey: "국제")
        map.updateValue(4, forKey: "학생")
        map.updateValue(5, forKey: "산학")
        map.updateValue(6, forKey: "일반")
        
        return map
    }
    
    public static func getCategory(index: Int) -> String? {
        return categoryMap[index] ?? nil
    }
    
    public static func getNoticeId(index: Int) -> String {
        return noticeId[index]
    }
    
    public static func getNoticeSubject(index: Int) -> String {
        return noticeSubject[index]
    }
    
    public static func getIndex(key: String) -> Int? {
        return indexMap[key] ?? nil
    }
}
