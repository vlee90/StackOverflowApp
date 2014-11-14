//
//  NetworkController.m
//  StackOverflowApp
//
//  Created by Vincent Lee on 11/10/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "NetworkController.h"

@interface NetworkController()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionConfiguration *configuration;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSString *apiDomain;
@property (nonatomic, strong) NSString *apiSite;

@end




@implementation NetworkController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration: self.configuration];
        self.apiDomain = @"http://api.stackexchange.com/2.2/";
        self.apiSite = @"site=stackoverflow";
        
    }
    return self;
}

- (void) requestOAuth: (NSString *) url {
    NSURL *getURL = [[NSURL alloc] initWithString:url];
    [[UIApplication sharedApplication] openURL: getURL];
}

- (void) fetchQuestionBasedOnTag: (NSString *) tag completionBlock:(void(^)(NSMutableArray *questionArray, NSError *error))completionBlockName {
    NSString *urlString = [NSString stringWithFormat: @"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", tag];
    NSURL *url = [[NSURL alloc] initWithString: urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: url];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *dataTask = [[self session] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger code = [httpResponse statusCode];
            if (code <= 299 && code >= 200) {
                NSLog(@"%ld: Success", code);
                NSDictionary *dictionary = [self parseJSON:data];
                NSArray *itemArray = [dictionary objectForKey:@"items"];
                NSMutableArray *questionArrayToPass = [[NSMutableArray alloc] init];
                for (NSDictionary *questionDict in itemArray) {
                    Question *question = [[Question alloc] initWithDictionary:questionDict];
                    [questionArrayToPass addObject: question];
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    completionBlockName(questionArrayToPass, error);
                }];
            }
            else {
                completionBlockName(nil, error);
            }
        }
        else {
            NSLog(@"%@", [error description]);
        }
    }];
    [dataTask resume];
}

- (NSDictionary *) parseJSON:(NSData *)JSONData {
    NSError *error;
    NSDictionary *dictionary =[NSJSONSerialization JSONObjectWithData:JSONData options: NSJSONReadingMutableContainers error:&error];
    if ([dictionary isKindOfClass: [NSDictionary class]]) {
        return dictionary;
    }
    else {
        return nil;
    }
}

@end