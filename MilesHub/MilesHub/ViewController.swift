//
//  ViewController.swift
//  MilesHub
//
//  Created by Mark Rustad on 8/30/17.
//  Copyright © 2017 Mark Rustad. All rights reserved.
//

import UIKit
import WebKit
import GoogleMobileAds

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate, GADBannerViewDelegate{
    
    @IBOutlet weak var webView:WKWebView!
    
    @IBOutlet var bannerView: GADBannerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        let request = URLRequest(url: url)
        webView.load(request)
        
        self.webView.navigationDelegate = self;
        
        
        let adRequest = GADRequest();
        adRequest.testDevices = [kGADSimulatorID];
        
        bannerView.adUnitID = "ca-app-pub-1677136425403292/5739466015";
        
        bannerView.rootViewController = self;
        bannerView.delegate = self;
        
        bannerView.load(adRequest);
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("did fail provisional navigation %@", error as NSError)
    }


    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        NSLog("did fail navigation %@", error as NSError)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

