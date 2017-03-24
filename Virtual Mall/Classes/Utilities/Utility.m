//
//  Utility.m
//  Virtual Mall
//
//  Created by Aditya Kumar on 06/03/17.
//  Copyright © 2017 mindfire. All rights reserved.
//
#import "Utility.h"
#import "Define.h"
#import "LoginPageViewController.h"
#import "SWRevealViewController.h"
#import "NSString+StringOperations.h"

@implementation Utility

//This method will show error message on screen
+ (void) promptErrorMessage:(NSString*)message sender:(UIViewController*)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"AppName", nil) message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [sender presentViewController:alert animated:YES completion:nil];
}

//Retrieve path For given NAME
+ (NSString*) retrievePathForNameInDocumentDirectory:(NSString*) fileName withFileType:(NSString*) type
{
    NSString*  docDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString* folderPath = [docDirectory stringByAppendingString:[NSString append:@"/" withSring:type]];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error;
    if(![fileManager fileExistsAtPath:folderPath])
        //create folder if does not exist
        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:&error];
    NSString  *filePath = [folderPath stringByAppendingPathComponent:fileName];
    return filePath;
}

//This method will create a slider menu button and connect slider menu button to third party (SWRevealVC) library
+ (void) setSliderBarButtonProperty:(UIViewController*)sender
{
    SWRevealViewController *revealViewController = sender.revealViewController;
    if ( revealViewController )
    {
        UIBarButtonItem* slideBarButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"SlideBarButton.png"] style:UIBarButtonItemStylePlain target:sender.revealViewController action:@selector( revealToggle: )];
        sender.navigationItem.leftBarButtonItem = slideBarButton;
        [sender.view addGestureRecognizer:sender.revealViewController.panGestureRecognizer];
    }
}


#pragma mark-Composing URL QUERY PARAMETRS


//Method Uses NSURLComponents to convert a dict to URL query parameter type
+(NSURL *) composeQueryParameters :(NSDictionary *)dict
{
	NSURLComponents *components=[NSURLComponents componentsWithString:kEmptyFieldNotation];
	NSMutableArray *parameters=[[NSMutableArray alloc]init];
	for(NSString *key in dict)
	{
		//each object of parameters array is of the type NSURLQueryItem
		[parameters addObject:[NSURLQueryItem queryItemWithName:key value:[dict valueForKey:key]]];
	}
	components.queryItems=parameters;
	NSURL *url=components.URL;
	return url;
	
}


//method joins all the URL components
+(NSString *) composeURLString :(NSDictionary *)dict withResource :(NSString *)resource
{
	NSURL *urlQueryParameters=[Utility composeQueryParameters:dict];
	
	//converting NSURL to NSString
	NSString *urlQueryParameterStr=urlQueryParameters.absoluteString;
	
	//joining all the components of URL
	NSString *urlString=[NSString stringWithFormat:@"%@%@%@",kVirtualMallHost,resource,urlQueryParameterStr];
	
	return urlString;
}

@end

