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
	@private
		WebSocket *ws;
}

@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, readonly) WebSocket *ws;

- (void)startMyWebSocket;
- (void)sendMessage:(NSString *)message;

@end
