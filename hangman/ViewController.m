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
@property(nonatomic,weak) IBOutlet UILabel  *wordLabel;
@property(nonatomic,weak) IBOutlet UILabel  *remainingGuessesLabel;
@property(nonatomic,weak) IBOutlet UIButton *aButton;
@property(nonatomic,weak) IBOutlet UIButton *bButton;
@property(nonatomic,weak) IBOutlet UIButton *cButton;
@property(nonatomic,weak) IBOutlet UIButton *dButton;
@property(nonatomic,weak) IBOutlet UIButton *eButton;
@property(nonatomic,weak) IBOutlet UIButton *fButton;
@property(nonatomic,weak) IBOutlet UIButton *gButton;
@property(nonatomic,weak) IBOutlet UIButton *hButton;
@property(nonatomic,weak) IBOutlet UIButton *iButton;
@property(nonatomic,weak) IBOutlet UIButton *jButton;
@property(nonatomic,weak) IBOutlet UIButton *kButton;
@property(nonatomic,weak) IBOutlet UIButton *lButton;
@property(nonatomic,weak) IBOutlet UIButton *mButton;
@property(nonatomic,weak) IBOutlet UIButton *nButton;
@property(nonatomic,weak) IBOutlet UIButton *oButton;
@property(nonatomic,weak) IBOutlet UIButton *pButton;
@property(nonatomic,weak) IBOutlet UIButton *qButton;
@property(nonatomic,weak) IBOutlet UIButton *rButton;
@property(nonatomic,weak) IBOutlet UIButton *sButton;
@property(nonatomic,weak) IBOutlet UIButton *tButton;
@property(nonatomic,weak) IBOutlet UIButton *uButton;
@property(nonatomic,weak) IBOutlet UIButton *vButton;
@property(nonatomic,weak) IBOutlet UIButton *wButton;
@property(nonatomic,weak) IBOutlet UIButton *xButton;
@property(nonatomic,weak) IBOutlet UIButton *yButton;
@property(nonatomic,weak) IBOutlet UIButton *zButton;


@end

@implementation ViewController

NSString *wordListString = @"";
NSString *hiddenWord = @"";
int wrongGuess = 0;
int guessRemain = 10;
bool correctGuess = false;
bool gameover = false;


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

- (void)enableAllLetters {
    [_aButton setUserInteractionEnabled:true];
    [_bButton setUserInteractionEnabled:true];
    [_cButton setUserInteractionEnabled:true];
    [_dButton setUserInteractionEnabled:true];
    [_eButton setUserInteractionEnabled:true];
    [_fButton setUserInteractionEnabled:true];
    [_gButton setUserInteractionEnabled:true];
    [_hButton setUserInteractionEnabled:true];
    [_iButton setUserInteractionEnabled:true];
    [_jButton setUserInteractionEnabled:true];
    [_kButton setUserInteractionEnabled:true];
    [_lButton setUserInteractionEnabled:true];
    [_mButton setUserInteractionEnabled:true];
    [_nButton setUserInteractionEnabled:true];
    [_oButton setUserInteractionEnabled:true];
    [_pButton setUserInteractionEnabled:true];
    [_qButton setUserInteractionEnabled:true];
    [_rButton setUserInteractionEnabled:true];
    [_sButton setUserInteractionEnabled:true];
    [_tButton setUserInteractionEnabled:true];
    [_uButton setUserInteractionEnabled:true];
    [_vButton setUserInteractionEnabled:true];
    [_wButton setUserInteractionEnabled:true];
    [_xButton setUserInteractionEnabled:true];
    [_yButton setUserInteractionEnabled:true];
    [_zButton setUserInteractionEnabled:true];
    [_aButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_bButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_cButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_dButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_eButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_fButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_gButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_hButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_iButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_jButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_kButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_lButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_mButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_nButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_oButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_qButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_tButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_uButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_vButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_wButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_xButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_yButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_zButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

}

- (void)disableAllLetters {
    [_aButton setUserInteractionEnabled:false];
    [_bButton setUserInteractionEnabled:false];
    [_cButton setUserInteractionEnabled:false];
    [_dButton setUserInteractionEnabled:false];
    [_eButton setUserInteractionEnabled:false];
    [_fButton setUserInteractionEnabled:false];
    [_gButton setUserInteractionEnabled:false];
    [_hButton setUserInteractionEnabled:false];
    [_iButton setUserInteractionEnabled:false];
    [_jButton setUserInteractionEnabled:false];
    [_kButton setUserInteractionEnabled:false];
    [_lButton setUserInteractionEnabled:false];
    [_mButton setUserInteractionEnabled:false];
    [_nButton setUserInteractionEnabled:false];
    [_oButton setUserInteractionEnabled:false];
    [_pButton setUserInteractionEnabled:false];
    [_qButton setUserInteractionEnabled:false];
    [_rButton setUserInteractionEnabled:false];
    [_sButton setUserInteractionEnabled:false];
    [_tButton setUserInteractionEnabled:false];
    [_uButton setUserInteractionEnabled:false];
    [_vButton setUserInteractionEnabled:false];
    [_wButton setUserInteractionEnabled:false];
    [_xButton setUserInteractionEnabled:false];
    [_yButton setUserInteractionEnabled:false];
    [_zButton setUserInteractionEnabled:false];
    [_aButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_bButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_cButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_dButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_eButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_fButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_gButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_hButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_iButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_jButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_kButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_lButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_mButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_nButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_oButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_pButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_qButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_rButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_sButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_tButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_uButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_vButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_wButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_xButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_yButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_zButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

#pragma mark - Interactivity Methods


-(IBAction)startNewGame:(id)sender {
    hiddenWord = @"";
    int randomWordIndex = arc4random_uniform((u_int32_t)_wordSetArray.count);
    _currentWord = [_wordSetArray[randomWordIndex] lowercaseString];
    NSLog(@"%@", _currentWord);
    gameover = false;
    wrongGuess = 0;
    guessRemain = 10;
    correctGuess = false;
    [self enableAllLetters];
    for (int h = 0; h < [_currentWord length]; h++) {
         hiddenWord= [hiddenWord stringByAppendingString:@"*"];
        NSLog(@"%@", hiddenWord);
    }
    _wordLabel.text = [NSString stringWithFormat:@"%@", hiddenWord];
}

-(IBAction)letterButtonPress:(UIButton *)button {
    if (gameover == true){
        [self disableAllLetters];
        NSLog(@"gameover");
    } else {
        [button setUserInteractionEnabled:false];
        correctGuess = false;
        NSString *searchstring = [button.titleLabel.text lowercaseString];
        for (int i = 0; i < [_currentWord length]; i++) {
            NSString *currentLetter = [_currentWord substringWithRange:NSMakeRange(i, 1)];
            if ([currentLetter isEqualToString:searchstring]) {
                NSLog(@"%@ found at %i",searchstring,i);
                correctGuess = true;
            } else {
                //NSLog(@"%@ not found at %i",searchstring,i);
            }
        }
        if (correctGuess == true) {
            [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            NSLog(@"%@ was in the word", searchstring);
        } else if (correctGuess == false && wrongGuess <= 8) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            wrongGuess ++;
            guessRemain --;
            NSLog(@"%@ was not in the word, you have %i ramaining guess", searchstring, guessRemain);
            _remainingGuessesLabel.text = [NSString stringWithFormat:@"%i",guessRemain];
        } else if (correctGuess == false && wrongGuess == 9) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            gameover = true;
            NSLog(@"Game Over");
            [self disableAllLetters];
        }
    }
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