//
//  ChatMessagesDataSource.m
//  NearMe
//
//  Created by TW on 9/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatMessagesDataSource.h"


@implementation ChatMessagesDataSource

@synthesize ws;
@synthesize messages;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"ChatCell";
	 
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	 
	// Set up the cell...
	NSString *cellValue = [messages objectAtIndex:[indexPath row]];
	cell.textLabel.text = cellValue;
	 
	return cell;
}

- (void)sendMessage:(NSString *)message {
	if (WebSocketReadyStateOpen) {
		[self.ws sendText:message];
	}
}

#pragma mark WebSocket

- (void) startMyWebSocket
{
    [self.ws open];
    
    //continue processing other stuff
    //...
}

#pragma mark Lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        //make sure to use the right url, it must point to your specific web socket endpoint or the handshake will fail
        //create a connect config and set all our info here
        WebSocketConnectConfig* config = [WebSocketConnectConfig configWithURLString:@"ws://poddb.com:9394/" origin:nil protocols:nil tlsSettings:nil headers:nil verifySecurityKey:YES extensions:nil ];
        config.closeTimeout = 15.0;
        config.keepAlive = 15.0; //sends a ws ping every 15s to keep socket alive

        //open using the connect config, it will be populated with server info, such as selected protocol/etc
        ws = [[WebSocket webSocketWithConfig:config delegate:self] retain];
		
		messages = [[NSMutableArray alloc] init];
    }
    return self;
    
}

- (void)dealloc 
{
	[messages release];
    [ws release];
    [super dealloc];
}

#pragma mark WebSocket Delegate methods

/**
 * Called when the web socket connects and is ready for reading and writing.
 **/
- (void) didOpen
{
    NSLog(@"Socket is open for business.");
}

/**
 * Called when the web socket closes. aError will be nil if it closes cleanly.
 **/
- (void) didClose:(NSUInteger) aStatusCode message:(NSString*) aMessage error:(NSError*) aError
{
    NSLog(@"Oops. It closed.");
}

/**
 * Called when the web socket receives an error. Such an error can result in the
 socket being closed.
 **/
- (void) didReceiveError:(NSError*) aError
{
    NSLog(@"Oops. An error occurred.");
}

/**
 * Called when the web socket receives a message.
 **/
- (void) didReceiveTextMessage:(NSString*) aMessage
{
    //Hooray! I got a message to print.
//    NSLog(@"Did receive message: %@", aMessage);
	
	[messages addObject:aMessage];
	NSLog(@"TABLE DATA: %@", [messages description]);
}

/**
 * Called when the web socket receives a message.
 **/
- (void) didReceiveBinaryMessage:(NSData*) aMessage
{
    //Hooray! I got a binary message.
}

/**
 * Called when pong is sent... For keep-alive optimization.
 **/
- (void) didSendPong:(NSData*) aMessage
{
    NSLog(@"Yay! Pong was sent!");
}

@end
