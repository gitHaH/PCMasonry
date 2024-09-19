//
//  ZMBaseFunc.swift
//  CYTest
//
//  Created by 张萌 on 2022/9/8.
//

import UIKit

class ZMBaseFunc {
    
    // base64编码
    class func base64Code(_ str:String)->String?{
        guard let data = str.data(using: .utf8) else{return nil}
        return data.base64EncodedString()
    }
    
    // 是否纯数字
    class func isAllNum(_ str:String)->Bool{
        let reg = "^[0-9]+$"
        let pre = NSPredicate(format: "SELF MATCHES %@", reg)
        return pre.evaluate(with: str)
    }
    
    class func dicFromString(_ jsonString:String)->[String:Any]?{
        guard let jsonData:Data = jsonString.data(using: .utf8),
              let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String:Any]
        else{
            return nil
        }
        return dict
    }
    
    //
    class func stringFromDic(_ dic:[String:Any])->String{
        var str = ""
        for (k,v) in dic {
            str += "\(k)=\(v)&"
        }
        if str.count > 0 {
           _ = str.removeLast()
        }
        return str
    }
    
    
    class func jsonFromDic(_ dictionary:[String:Any])->String{
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            CYPrint("无法解析出JSONString")
            return ""
        }
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?  else{
            return ""
        }
        guard let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue) else{return ""}
        return JSONString as String
    }
    
    /// 金额
    class func moneyWithDot(_ money:Double)->String{
        var m = money
        var isFu = false
        if money < 0{
            m = money*(-1)
            isFu = true
        }
        let str = String.init(format: "%.2f", m)
        let arr = str.components(separatedBy: ".")
        let subArr:NSString = arr[0] as NSString
        var newStr = NSMutableString.init()
        if subArr.length > 3{
            for i in 0..<subArr.length{
                let s = subArr.substring(with: NSMakeRange(subArr.length-i-1, 1))
                newStr.insert(s, at: 0)
                if i > 0 && (i+1)%3 == 0{
                    newStr.insert(",", at: 0)
                }
            }
            if newStr.hasPrefix(","){
                newStr.deleteCharacters(in: NSMakeRange(0, 1))
            }
        }else{
            newStr = NSMutableString.init(string: subArr)
        }
        if isFu{
            newStr.insert("-", at: 0)
        }
        return "\(newStr).\(arr[1])"
    }
    class func percentWithDot(_ money:Double)->String{
        let str = String.init(format: "%.f", money)
        let arr = str.components(separatedBy: ".")
        let subArr:NSString = arr[0] as NSString
        var newStr = NSMutableString.init()
        if subArr.length > 3{
            for i in 0..<subArr.length{
                let s = subArr.substring(with: NSMakeRange(subArr.length-i-1, 1))
                newStr.insert(s, at: 0)
                if i > 0 && (i+1)%3 == 0{
                    newStr.insert(",", at: 0)
                }
            }
            if newStr.hasPrefix(","){
                newStr.deleteCharacters(in: NSMakeRange(0, 1))
            }
        }else{
            newStr = NSMutableString.init(string: subArr)
        }
        
        return newStr as String
    }
    class func intWithDot(_ intNum:Int)->String{
        var num = intNum
        var isFu = false
        if intNum < 0 {
            isFu = true
            num = intNum*(-1)
        }
        
        let str = String(num)
        var newStr = NSMutableString.init()
        if str.count > 3{
            for i in 0..<str.count{
                let s = str.subRangeString(str.count-i-1, 1)
                newStr.insert(s, at: 0)
                if i > 0 && (i+1)%3 == 0{
                    newStr.insert(",", at: 0)
                }
            }
            if newStr.hasPrefix(","){
                newStr.deleteCharacters(in: NSMakeRange(0, 1))
            }
        }else{
            newStr = NSMutableString.init(string: str)
            
        }
        if isFu{
            newStr.insert("-", at: 0)
        }
        return newStr as String
    }
}
