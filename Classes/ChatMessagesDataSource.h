//
//  ChatMessagesDataSource.h
//  NearMe
//
//  Created by TW on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebSocket.h"


@interface ChatMessagesDataSource : NSObject <UITableViewDataSource, WebSocketDelegate> {
	NSMutableArray *messages;
	UITableView *chatTableView;
	@private
		WebSocket *ws;
}

@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, retain) UITableView *chatTableView;
@property (nonatomic, readonly) WebSocket *ws;

- (id)initWithTableView:(UITableView *)tableView;
- (void)startMyWebSocket;

@end
