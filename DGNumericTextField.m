//
//  DGNumericTextField.m
//  TestTextField
//
//  Created by Dmytro Golub on 26/02/2013.
//  Copyright (c) 2013 Dmytro Golub. All rights reserved.
//

#import "DGNumericTextField.h"

@interface DGNumericTextField()
{
    id<UITextFieldDelegate> externalDelegate;
}
@end


@implementation DGNumericTextField

-(id) initWithCoder:(NSCoder*) coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // Initialization code
        super.delegate = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        super.delegate = self;
    }
    return self;
}

-(void) setDelegate:(id<UITextFieldDelegate>)delegate
{
    externalDelegate = delegate;
}

-(id<UITextFieldDelegate>) delegate
{
    return self;//externalDelegate;
}


#pragma mark UITextFieldDelegate methods


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSRange numericRange = [string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]];
    if (numericRange.location == NSNotFound)
    {
        if ([externalDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
        {
            return [externalDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        else
            return YES;
    }
    return NO;
}

#pragma mark ForwardInvocation

-(BOOL) respondsToSelector:(SEL)aSelector
{
    if ([externalDelegate respondsToSelector:aSelector])
        return YES;
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
   
    NSMethodSignature *sig;
    sig = [(NSObject*)externalDelegate methodSignatureForSelector:aSelector];
    if (sig)
    {
         NSLog(@"%s",sel_getName(aSelector));
        return sig;
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL aSelector = [invocation selector];
    
    if ([externalDelegate respondsToSelector:aSelector])
    {
        NSLog(@"%@",invocation);
        [invocation invokeWithTarget:externalDelegate];
    }
    else
        [super forwardInvocation:invocation];
}


@end
