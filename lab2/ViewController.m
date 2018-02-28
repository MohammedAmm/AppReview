//
//  ViewController.m
//  lab2
//
//  Created by Sara Ashraf on 2/14/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
#import "ILMovieDBClient.h"
#import <LHTMDbClient.h>
#import "MovieAPI.h"
#import "Movie.h"
#import "AFNetworking.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    /*
    //NSLog([MovieAPI GET_POPULAR_MOVIES_URL]);
    NSString* path = [MovieAPI GET_POPULAR_MOVIES_URL];
   // NSLog(path);
    NSURL* url = [[NSURL alloc] initWithString:path];
  //  NSString* data = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSData* dd = [[NSData alloc] initWithContentsOfURL:url options:NSUTF8StringEncoding error:nil];
    NSMutableDictionary* dicData = [NSJSONSerialization JSONObjectWithData:dd options:NSJSONReadingAllowFragments error:nil];
    
    
    NSMutableArray* s = [dicData objectForKey:@"results"];
    
    NSMutableDictionary* ss = [s objectAtIndex:1];
    
    //Movie* m = [[Movie alloc] initWithString:ss error:nil];

    
    Movie *movie =
    [[Movie alloc] initWithDictionary:ss error:nil];

    
    //NSLog([ss objectForKey:@"title"]);

    NSLog([movie title]);
    

    
    
    //NSLog([ss objectForKey:@"poster_path"]);
    
      
    
    
    NSString* stringImageURL =[MovieAPI GET_MOVIE_IMAGE_PATH_With_Image:[movie poster_path]];
    
    NSURL* imageURL = [[NSURL alloc] initWithString:stringImageURL];
    
    
    //    [_myimage sd_setImageWithURL:[NSURL URLWithString:@"http://api.androidhive.info/json/movies/7.jpg"]
//                     placeholderImage:[UIImageimageNamed:@"1.jpg"]];
//    

   
    [_myimage sd_setImageWithURL: imageURL];
    
    */
    
    [self getData];
    //[MovieAPI GE_TDATE_ON_SUCESS:@selector(sucessFunction) ON_ERROR:@selector(failFunction)];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) getData{
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
            NSLog(@"Error: %@", error);
            //onError;
            //   [self performSelector:@selector(onError) withObject:myString];
        } else {
            
            //statr to parse your data
            [self getMoviesArrayfromString:responseObject];
            // onSucess;
        }
    }];
    [dataTask resume];
    
}

-(void)getMoviesArrayfromString:(NSMutableDictionary*) data{
    
    
    
    NSMutableArray* moviesList = [data objectForKey:@"results"];
    
    //this code is for testing image
    NSMutableDictionary* ss = [moviesList objectAtIndex:1];
    NSString* stringImageURL =[MovieAPI GET_MOVIE_IMAGE_PATH_With_Image:[ss objectForKey:@"poster_path"]];
    NSURL* imageURL = [[NSURL alloc] initWithString:stringImageURL];
       [_myimage sd_setImageWithURL: imageURL];
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

-(void)  sucessFunction{

    printf("sucessed");

}
-(void) failFunction{
    
    printf("fail");
    
}
@end
