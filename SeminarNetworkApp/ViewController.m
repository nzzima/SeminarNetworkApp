//
//  ViewController.m
//  SeminarNetworkApp
//
//  Created by Nikita Krylov on 29.11.2024.
//

#import "ViewController.h"
#import "Loader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loader = [Loader new];
    [self performLoadingGetRequest];
}

- (void)performLoadingGetRequest {
    [self.loader perfomeGetRequests:@"https://postman-echo.com/get" arguments:@{@"ark1":@"wal1", @"ark2":@"wal2"} myblock:^(NSDictionary* dict, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(error) {
                NSLog(@"%@", error);
                return;
            }
            NSLog(@"%@", dict);
        });
    }];
}


@end
