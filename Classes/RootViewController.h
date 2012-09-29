//
//  RootViewController.h
//  NearMe
//
//  Created by TW on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController <UIWebViewDelegate> {
	IBOutlet UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
