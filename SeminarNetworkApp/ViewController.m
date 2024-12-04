//
//  ViewController.m
//  SeminarNetworkApp
//
//  Created by Nikita Krylov on 29.11.2024.
//

#import "ViewController.h"
#import "Loader.h"
#import "UIKit/UIKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [Loader new];
    [self performLoadingGetRequest];
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"]];
                if ( data == nil )
                    return;
                dispatch_async(dispatch_get_main_queue(), ^{
                    // WARNING: is the cell still using the same data by this point??
                    //UIImage *image = [UIImage imageWithData:data];
                    cell.imageView.image = [UIImage imageWithData: data];
                    cell.textLabel.text = @"Test";
                    //NSLog(@"%@",image);

                });
            });

    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
