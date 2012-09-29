//
//  ChatViewController.h
//  NearMe
//
//  Created by TW on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"
#import "ChatMessagesDataSource.h"


@interface ChatViewController : UIViewController <HPGrowingTextViewDelegate, UITableViewDelegate> {
	UITableView *chatTableView;
	UIView *containerView;
    HPGrowingTextView *textView;
}

@property (nonatomic, retain) UITableView *chatTableView;

-(void)resignTextView;

@end
