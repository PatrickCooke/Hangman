//
//  ViewController.m
//  hangman
//
//  Created by Patrick Cooke on 4/14/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property(nonatomic,strong)     NSArray     *wordSetArray;
@property(nonatomic,strong)     NSString    *currentWord;

@end

@implementation ViewController

NSString *wordListString = @"";

#pragma mark - Core Methods

- (NSString *)readBundleFileToString:(NSString *)filename ofType:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:type];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}

- (NSArray *)convertCSVStringToArray:(NSString *)csvString {
    NSString *cleanString = [[csvString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@","];
    return [cleanString componentsSeparatedByCharactersInSet:set];
}

#pragma mark - Interactivity Methods


-(IBAction)startNewGame:(id)sender {
    int randomWordIndex = arc4random_uniform((u_int32_t)_wordSetArray.count);
    _currentWord = _wordSetArray[randomWordIndex];
    NSLog(@"%@", _currentWord);
}


#pragma mark - Life Cycle Method

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *wordString = [self readBundleFileToString:@"WordSetApple" ofType:@"csv"];
    _wordSetArray = [self convertCSVStringToArray:wordString];
    NSLog(@"Count %li",_wordSetArray.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end