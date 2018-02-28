//
//  MovieAPI.h
//  lab2
//
//  Created by Sara Ashraf on 2/27/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieAPI : NSObject
+(NSString*) GET_TOP_RATED_MOVIES_URL;
+(NSString*) GET_POPULAR_MOVIES_URL;
+(NSString*) GET_MOVIE_IMAGE_PATH_With_Image:(NSString*)image;
+(void)GE_TDATE_ON_SUCESS:(SEL)onSucess ON_ERROR:(SEL)onError;
@end
