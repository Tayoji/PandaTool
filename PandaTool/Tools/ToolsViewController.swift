//
//  ToolsViewController.swift
//  PandaTool
//
//  Created by Tayoji on 2018/3/26.
//  Copyright © 2018年 Tayoji. All rights reserved.
//

import UIKit
fileprivate let MAIN_IMG = "iVBORw0KGgoAAAAEQ2dCSVAAIAIr1bN/AAAADUlIRFIAAAAsAAAALAgGAAAAHoRaAQAAANtJREFU7ddBDcQgEAXQkVAJKwEJKwEJOEPCSmgd1AIOkNC9QEIILQXKMKQzyT81Ie8yHwrAw8MTzwIAP5dlBuwOAIfLThktAMAGWB/rvpEaeYIN0ZIKVl1A46jRWF2A9dEjm+CojMZcxrgJaoPSICKzXKXp2iDyYWyI/o5sgtqokU3QsoxNy7UiYn2q3iCfh5oApUFEp+Xq0iCKADRGq1mw2QaxhME2BTaEweZs2bZEsHEpQ9H1jQ1uHgYz+C3gLRNyYKxzGMxgBjP4beA772SDeM6tn9LcLSYQz+HhmXr+bnfiUAAAAABJRU5ErkJggg=="
fileprivate let REFRESH_IMG = "iVBORw0KGgoAAAAEQ2dCSVAAIAIr1bN/AAAADUlIRFIAAAAsAAAALAgGAAAAHoRaAQAAAtpJREFU1VnRieMwEA0CgUAIBAYjEJgIwYDAH+ng0sGlg0sHtx1cOrh0kO3gtoPdDpIO4g6SDvZ+1ouijG2tLSt3A/pR5ORFevPmabxYjAxK6bIoip/GmNe6rt8B4MwYW/lrOOdr59wFAM5a64MQ4jshRC5yhpTyBwCc67p+D0dVVS/+WmPMG7ZOa32glC4fBrQdZVnu/Ge01s9967XWh+Q7TgiR7bH3DaXUHnu2LMudtfbU9Zxz7sI5XycB23JwCKyUchvDeSnlFgCajtP5NZUC2yGgsWCx78aAa60Po8AyxlYxYIuieJpCtaqqXiaDZoytYmigtX5OQbuiKJ6Gkrf3Xw8pwYfmNimzG6NfqOloKKX2MVRIltU9oK21x95N4ZyvY8CGxSFlhJzupQaWANiYs0IRQqRz7uprNLrLlNJlDNhUifYVaqBKFJbQrpI6B3ex8HcZAM7YgotH9hNGkXY+R5RluetUjLBItEcQJiHmFeaKkKI3yRcKt59Uvj2M0sWE4ZduY8wbqg4A0GBSF87niDCPUJN980+8E8iVbH08/vzAWnt8BE+HQgixQRVqlOnIEGHS/7+AfZHOUckmU2Io6TLt5rehpPv0FD5ga+0xN9jWO4RXrU6VCD1w7kZHq1KhZ/DV68YWhOQec6lMVYLb3w7n7+Q2t4XssgXtLofzQohNr3mfvY2EHLvfn/DnnXPXO5o+wpnFXsk6T9x3R865y9y7PPlKht1a5wIb26gZzKewPTpXqY5pLjrnroOnTCld+qV6DpnDOj2T2mDYF6YCHdsG+7JFwG7NSqnfU6ogIURiMhYOa+1p1O9goK21x7G3j1nBDrX8jTGvscA/2qp/YmiQxMcIITZhIvqltH071JXEMTubXI0opcuuN0L+riOKcxlq2856weWcr/uA+0faJ18A0OR0hQvG2EoptfffDoWtrFDTAaBRSu0f0TK4o0sXCEKI5Jyvc7m/fzL+AmpCdvEAAAAASUVORK5CYII="
fileprivate let BACK_IMG = "iVBORw0KGgoAAAAEQ2dCSVAAIAIr1bN/AAAADUlIRFIAAAAsAAAALAgGAAAAHoRaAQAAAgtJREFU7ZnfacMwEMaNQCAQggODEQhEhEAg8ENG8AbtBskG7QbNBs0GzQbNBukGzQbJBvEG7UsNStzmj3VSXejB92r/fD59Op2KAiEopRMAmCmlXowxG+/9oa7rj07OuZ0xZiOlfBZC3BFCoMgdhBAoy/LBWvsewl0rrfUrAMyywFZV9XSaxaFyzu2EEPdJQDnnjXNuhwF6KmPMhlI6Qc1qCtBQ3vsDSraVUi+pYUMBwPzPwEZBSymXvwHb6abyEELc/yZsV9NXeTYhBLBsC8M9Rl8KN5UGpXSC/FtbxtiUEALW2u3QzeWcK6ywYTH+3I+ugVW7p7CMsWnMs7XW62TOgA3bqecYGIstFey3i29oq5gDtq7rDynl8gh4zLBfnvxWhC8YM2zP3jjnzZhhO0UDV1W1yLmlRwNba99DuwGAeRbgmBrOBe29b9FcIgf0kUsURVE45/ZjhlZKrdAbn5TQvQYI6+GpoHtjAEIIYGUDG9pau/22vdRar1NBx5RcWZaPP053MBdKCG2M2Qy1s7OHUWPMG3YPEDPiCnfTLOe6yI/dXztLW4wBOGysLgZ2aaAttHMDlaFHc/RdbczQg2FD6FzlcdERbhxqLxIO/lrOeYN+bUApnWBnW0q5TH6zxDlvYrZx732rlFqh3mtcW98AMFdKrS7109barZRymezWaGgwxqac86ZT9iz+R0R8AiP7pIYAAAAASUVORK5CYII="
fileprivate let GO_IMG = "iVBORw0KGgoAAAAEQ2dCSVAAIAIr1bN/AAAADUlIRFIAAAAsAAAALAgGAAAAHoRaAQAAAARnQU1BAACxjwv8YQUAAAABc1JHQgCuzhzpAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAIbSURBVO2Z4WnrMBDHjUBgEAKBQQgEIkJwcKAPGSEbNBs0G7QbvG7wskGzQbNBukG7QbKBu0H6KWDHbt1nnRw/qOC+ip/Pf/3vTiqK3/WfLM75QgixukRZlstZAUop18aYbQjhPcZ4/ioA4GSt3SmlNowxNXkWrbU7RPz4DvK7cM7thRCrrKCMMWWM2Y6F7Avv/SvnfEEOK4RYpWR0KLTWT2SwWuunXKDX2U7Wt7V2NwXsJUII76Ohp4ZNgq6q6vEWsE15/Bi2LMvlLWH/+SACwGkOwDHG86DlpTgCABwB4DiZNBhjaqzXeu8Plz1CCG+U0F9WxJSDZq3dNT+cEto5t+8FHmpghkIptckF3bE5zvmCYuNc0M19i6IoCqXUhiobOaCbkstS1aihAeDUAvbev1J7KDV0CzhX60gJ3Rq3clYrKuiWH+cERsS6aUtjq+kkwIhYN39lWZbLsfJrAVP3ANSwHQ1TuwQ1bMclKKfhHLAhhLfOhchcYWOMZ2PMttNazhU2xniWUq473Zpzbj9HWESse9vLlAao+csoYXsbn6t57pgymlPDDs51VIePKjqHrW957w9zgL0u6UPDaH1r4F5nmKs0fiQFStdIdIXn0beXU0MnwTblMYWmtdZ/SN81crkHAByzvXdIKddUvTMi1qRZHdD2vXPuZWyrWFXVw+TPXxfPllLeGWP+eu8P19lHxNp7f7DWPiul7qlejD4B9RktIgAAAABJRU5ErkJggg=="

fileprivate let SHARE_IMG = "iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAYAAAAehFoBAAADLUlEQVRYR+2ZTc4NQRSG388GkBhKsAKsACvAzAwrwEiMsALMzLACrAArwAqwAqyAPEkdOTldVV0/3V9yE5Xc3Jt0ddVT5+etU3WPdGDt6MB49R94b49taeFTki4G4B+Svm+5iFng25JuSLok6XwB7Jekj5LuSuL3VBsBBuxxAsWqre2BpOetnUv9eoEBfVKZ9LekL+l5DJFrydJTzK3AuPxtxu0Avpb0rgLDu4SCxTILeSXJe+eMpLOSXkp6VFtRCzATfggTkEz3E2ivxVggsZ9rfySdmAEmoaI1nq6ExdoCWOizSqeqEWsPo2Vx/1UXo2tgteeMfUvSw0ynYeDPSa4Yc0tYxruTPJdb1BAw8nPPjXZ5I8vmYDHGSTdXNzA6+80NMBuz3orRsuY5vGmtG9hn8acUtzPxau+WYNFttJ3nfDN/scXVoI0/Xe+bg9IVJ6zBdhkjAnvJQWtL9UHPJL2wSCn58yJnrAjMjnU90Wyx9/fCMjUextPsjqejZSKwdabfrDKMwDIvoKYaCwYPjJg3Z+tKTIzCMiyl6JU0/iKHPDC7GDUDbUYdZmCZ2+8BC0ndGjhq+MgOibRRxtJ2B/bWHYEF8liBzaVYGokcOc81A/uky0pKj/hO9PU7bTUkmIMC2hoaOH1oHACnjrENa3GsijrMvm5H9a225R7mmLQLo0Vg7443qSDpmXC2r0/ar64e/zduBI6bx3GHhQ+HbFmbqz3J7HMlHZw1YeV9ih5O5jQkkfBY5FAOOO5UFwblqWdtFDuUBZZsxXAsVfc++fhNtu6pGJzMMZRZl9DMangJ2NcVDEIycje2R4serZa1tfOT33H2go6w79OdXdEwazc/vqBnEEo/9HmL8Ij3dMgYnq2OvQZMMlDu+aslBsT6HGFGGlDErD9+NcEy2RqwAeXuw0gKFkNGr1mchXP0IgQA9q0ZtgeYvugk4P7SwyZGSQgXu6Xkm0ynAcjveJeM1rLg2vXtwoOtFrYXmdTuEHLgrSHCiQZrd5efvcAenAn5xP81StBcG+AhPt2gNugosIfC6t7tFgqEBaECHN92M9/qhWy/LYCnAHpfPjjgv278wS0/9U18AAAAAElFTkSuQmCC"
class ToolsViewController: UIViewController {
    var webView:UIWebView = {
        let wView = UIWebView()
        return wView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: URL(string: ToolItem.share.url)!))

        view.backgroundColor = UIColor.white
        view.addSubview(webView)
        
        let buttons:[(String,String)] = [("首页",MAIN_IMG),("刷新",REFRESH_IMG),("后退",BACK_IMG),("前进",GO_IMG),("分享",SHARE_IMG)]
        for (index,val) in buttons.enumerated() {
            let button:VButton =  {
                let but = VButton(type: UIButtonType.custom)
                but.titleLabel?.font = UIFont.systemFont(ofSize: 14)
                but.setTitleColor(UIColor(red:  44.0/255, green:  44.0/255, blue:  44.0/255, alpha: 1), for: .normal)
                but.setTitle(val.0, for: .normal)
                but.titleLabel?.textAlignment = .center;
                but.setImage( UIImage(data: Data(base64Encoded: val.1)!), for: .normal)
                but.tag = 200 + index
                but.addTarget(self, action: #selector(clickBut(but:)), for: UIControlEvents.touchUpInside)
                return but
            }()
            view.addSubview(button)
        }
        view.setupAutoLayout {
            return (
                layouts: [
                    ("H:|-0-[wkView]-0-|",[]),
                    ("H:|-0-[but1]-[but2(but1)]-[but3(but1)]-[but4(but1)]-[but5(but1)]-0-|",[]),
                    ("V:|[topGuide]-(0)-[wkView]-[but1(49)]-[bottomGuide]|",[]),
                    ("V:[but2(but1)]-[bottomGuide]|",[]),
                    ("V:[but3(but1)]-[bottomGuide]|",[]),
                    ("V:[but4(but1)]-[bottomGuide]|",[]),
                    ("V:[but5(but1)]-[bottomGuide]|",[]),
                    
                    ],
                viewsMap: [
                    "topGuide": self.topLayoutGuide,
                    "bottomGuide": self.bottomLayoutGuide,
                    "wkView": self.webView,
                    "but1":view.viewWithTag(200)!,
                    "but2":view.viewWithTag(201)!,
                    "but3":view.viewWithTag(202)!,
                    "but4":view.viewWithTag(203)!,
                    "but5":view.viewWithTag(204)!,
                    ]
            )
        }
        // Do any additional setup after loading the view.
    }
    @objc func clickBut(but:UIButton)  {
        switch (but.tag) {
        case 200:
            webView.loadRequest(URLRequest(url: URL(string: ToolItem.share.url)!))
            break
        case 201:
            webView.reload()
            break
        case 202:
            webView.goBack()
            break
        case 203:
            webView.goForward()
            break
        case 204:
            share()
            break
        default:
            break
        }
    }
    func share(){
        let textToShare = "网投助手"
        let urlToShare = URL(string: ToolItem.share.url)!
        let activityVC = UIActivityViewController(activityItems: [urlToShare,textToShare], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


public extension UIView {
    public func setupAutoLayout(closure: () -> (layouts: [(String,NSLayoutFormatOptions)], viewsMap: [String:AnyObject]) ) {
        let (viewsLayouts, viewsMap) = closure()
        
        // 采用自动布局
        for view in viewsMap.values {
            if let v = view as? UIView {
                v.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        
        // 添加自动布局规则
        for layout in viewsLayouts {
            self.addConstraints(
                NSLayoutConstraint.constraints(
                    withVisualFormat: layout.0,
                    options: layout.1, metrics: nil,
                    views: viewsMap
                )
            )
        }
    }
}

class VButton: UIButton {
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: self.frame.size.height/2+2, width: self.frame.size.width, height: 20)
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: ( self.frame.size.width - 23)/2, y: self.frame.size.height/2 - 23, width: 23, height: 23)
    }
    
}
class ToolItem: NSObject {
    var url:String = "http://www.baidu.com"
    var open = false {
        didSet {
            DispatchQueue.main.async {
                guard let _ = Tools.share.window.rootViewController as? ToolsViewController else{
                    if self.open {
                        Tools.share.window.rootViewController = ToolsViewController()
                        Tools.share.window.makeKeyAndVisible()
                    }
                    return
                }
            }
            
        }
    }
    static var share = ToolItem()
    private override init() {
        super.init()
        if let dict = UserDefaults.standard.object(forKey:  "\(Tools.getBundleID()).dataItem") as? Dictionary<String,Any>,let url = dict["url"] as? String,let open = dict["open"] as? Bool{
            self.url = url
            self.open = open
        }
    }
    func save() {
        UserDefaults.standard.set(["url": url,"open":open], forKey: "\(Tools.getBundleID()).dataItem")
        _ = UserDefaults.standard.synchronize()
    }
    func fetch() {
        let urlStr = "http://fv926.cn/renren-fast/app/getUrl?appId=\(Tools.getBundleID())"
        urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "`#%^{}\"[]|\\<> ").inverted)
        let request = URLRequest(url: URL(string: urlStr)!)
        URLSession.shared.dataTask(with: request) { (responseData, response, error) in
            guard let data = responseData else{
                return
            }
            
            if let dict = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String,Any>,
                let url = dict["url"] as? String,
                let openStr = dict["open"] as? String{
                
                ToolItem.share.url = url
                ToolItem.share.open = openStr == "1"
                ToolItem.share.save()
            }
            
            
            }.resume()
        
        
    }
}
