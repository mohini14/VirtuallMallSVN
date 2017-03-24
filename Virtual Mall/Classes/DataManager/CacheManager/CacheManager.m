//
//  CacheManager.m
//  Virtual Mall
//
//  Created by Mohini Sindhu  on 17/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "CacheManager.h"

#define kImageTypeFolder @"images"

@implementation CacheManager

//Get an Instance of Cache Manager Class
+(instancetype) getInstance
{
	static dispatch_once_t once;
	static CacheManager *sinstance=nil;
	if(sinstance==nil)
	{
		dispatch_once(&once, ^
		{
			sinstance = [[CacheManager alloc]init];
		});
	}
	return sinstance;
}



//Check if the image is present in Cache Manager or not
-(void) imageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *))callBackToMainVC
{
	CacheManager *imgCached=[CacheManager getInstance];
	UIImage *img=[imgCached loadImageForURL:imageURL];
	if(img)
	{
		callBackToMainVC(img);
	}
	else
	{
		[imgCached downloadImageForURL:imageURL withCompletionHandler :^(UIImage *imageDownloaded){
			callBackToMainVC(imageDownloaded);
		}];
	}
}



//DownLoad Image For the Very First Time
-(void) downloadImageForURL :(NSString *)imageURL withCompletionHandler:
															(void (^) (UIImage *downloadedImage))callBack
{
	NSURL *imageNSURL=[NSURL URLWithString:imageURL];
	
	NSURLSessionConfiguration *sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *session=[NSURLSession sessionWithConfiguration:sessionConfiguration];
	
	NSURLSessionDownloadTask *downloadTask=[session downloadTaskWithURL:imageNSURL completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error)
											{
												NSData *data=[NSData dataWithContentsOfURL:location];
												UIImage *downloadedImage=[UIImage imageWithData:data];
												[self saveDownloadedImage:downloadedImage withURL:imageNSURL];//saving downloaded Image
												
												[[NSOperationQueue mainQueue] addOperationWithBlock:^{
													callBack(downloadedImage);
												}];
												
											}];
	
	[downloadTask resume];
	
}

//Save image when Downloaded
-(void) saveDownloadedImage :(UIImage *)image withURL:imageURL
{
	if(image !=nil)
	{
		//retrieving path and corresponding name of file
		NSString *pathToSaveImages=[Utility retrievePathForNameInDocumentDirectory :[imageURL lastPathComponent] withFileType:kImageTypeFolder];
		NSData *imageData=UIImagePNGRepresentation(image);
		[imageData writeToFile:pathToSaveImages atomically:NO];
	}
}

// Retreving image from cache manager for given "PATH" in Documnet Directory for given "NAME"
-(UIImage *)loadImageForURL :(NSString *)imgURL
{
	UIImage *image=[UIImage imageWithContentsOfFile:[Utility retrievePathForNameInDocumentDirectory :[imgURL lastPathComponent] withFileType:kImageTypeFolder]];//loading image if already present
	return image;
}


@end
