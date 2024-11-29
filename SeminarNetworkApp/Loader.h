//
//  Loader.h
//  SeminarNetworkApp
//
//  Created by Nikita Krylov on 29.11.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Loader : NSObject

@property(nonatomic) NSURLSession* session;

-(void)perfomeGetRequests:(NSString*) stringUrl arguments:(NSDictionary*) arguments myblock:(void(^)(NSDictionary*, NSError*)) block;
-(void)perfomePostRequests:(NSString*) stringUrl arguments:(NSDictionary*) arguments myblock:(void(^)(NSDictionary*, NSError*)) block;
-(NSDictionary*)parseJsonData:(NSData*) data error:(NSError**) error;
-(NSDate*)dataWithJson:(NSDictionary*) jsonDict error:(NSError**) error;

@end

NS_ASSUME_NONNULL_END
