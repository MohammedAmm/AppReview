//
//  MovieAPI.m
//  lab2
//
//  Created by Sara Ashraf on 2/27/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

#import "MovieAPI.h"
#import "AFNetworking.h"
#import "Movie.h"
@implementation MovieAPI{

   
}
const NSString* API_KEY = @"e5f9929ddcdead7015fdb6048e240743";
const NSString* MOVIE_API_BASE_UTL = @"https://api.themoviedb.org/3/movie/";
const NSString* QUERY = @"?";
const NSString* QUERY_KEY = @"api_key=";
const NSString* QUERY_LANG_AND_PAGES = @"&language=en-US&page=1";
const NSString* IMAGE_PATH = @"https://image.tmdb.org/t/p/w185/";




+(NSString*) GET_POPULAR_MOVIES_URL{
    NSString* popularDir = @"popular";
    popularDir = [MOVIE_API_BASE_UTL stringByAppendingString:popularDir];
    popularDir = [popularDir stringByAppendingString:QUERY];
    popularDir = [popularDir stringByAppendingString:QUERY_KEY];
    popularDir = [popularDir stringByAppendingString:API_KEY];
    popularDir = [popularDir stringByAppendingString:QUERY_LANG_AND_PAGES];
    return popularDir;
}

+(NSString*) GET_TOP_RATED_MOVIES_URL{
    NSString* popularDir = @"top_rated";
    popularDir = [MOVIE_API_BASE_UTL stringByAppendingString:popularDir];
    popularDir = [popularDir stringByAppendingString:QUERY];
    popularDir = [popularDir stringByAppendingString:QUERY_KEY];
    popularDir = [popularDir stringByAppendingString:API_KEY];
    popularDir = [popularDir stringByAppendingString:QUERY_LANG_AND_PAGES];
    return popularDir;
}

+(NSString*) GET_MOVIE_IMAGE_PATH_With_Image:(NSString*)image {
    return [IMAGE_PATH stringByAppendingString:image];
}




+(void)GE_TDATE_ON_SUCESS:(SEL)onSucess ON_ERROR:(SEL)onError{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    //get Your category popularmovie | Top rated
    // using MovieAPI class
    NSString* category =[MovieAPI GET_POPULAR_MOVIES_URL];
    NSURL *URL = [NSURL URLWithString:category];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            // Handel Error To Featch Data
            //including network is not avilable
            // and no data found
            //NSLog(@"Error: %@", error);
            //onError;
         //   [self performSelector:@selector(onError) withObject:myString];
        } else {
            
            //statr to parse your data
            //[self getMoviesArrayfromString:responseObject];
           // onSucess;
        }
    }];
    [dataTask resume];
    
}
+(void)getMoviesArrayfromString:(NSMutableDictionary*) data{
    
    
    
    NSMutableArray* moviesList = [data objectForKey:@"results"];
    
    //this code is for testing image
    NSMutableDictionary* ss = [moviesList objectAtIndex:1];
    NSString* stringImageURL =[MovieAPI GET_MOVIE_IMAGE_PATH_With_Image:[ss objectForKey:@"poster_path"]];
    NSURL* imageURL = [[NSURL alloc] initWithString:stringImageURL];
 //   [_myimage sd_setImageWithURL: imageURL];
    //------------------
    
    
    //TODO for loop and convert movies objects to movie class
    // and create your data source to be bined to the collection view
    NSMutableArray* movieaArray = [NSMutableArray new];
    for (NSMutableDictionary *m in moviesList) {
        Movie *movie =
        [[Movie alloc] initWithDictionary:m error:nil];
        //NSLog([ss objectForKey:@"title"]);
        NSLog(@"%@",[movie title]);
        [movieaArray arrayByAddingObject:movie];
    }
    
    
}







@end
