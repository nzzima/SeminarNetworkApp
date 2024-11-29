//
//  ViewController.h
//  SeminarNetworkApp
//
//  Created by Nikita Krylov on 29.11.2024.
//

#import <UIKit/UIKit.h>
#import "Loader.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic) Loader* loader;

@end

