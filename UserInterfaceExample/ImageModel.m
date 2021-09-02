//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imageDict = _imageDict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff"];
        
    
    return _imageNames;
}

-(NSMutableDictionary*) imageDict{
    
    if(!_imageDict){
        _imageDict = [[NSMutableDictionary alloc]init];
        
        for(id obj in _imageNames){
            
           _imageDict[obj] = [self getImageWithName: obj];
            
        }
    }
    return _imageDict;
}


-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    image = [UIImage imageNamed:name];
    
    return image;
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    
    NSString* name = [_imageNames objectAtIndex : index];
    
    return _imageDict[name];
        
}

-(NSInteger)numberOfImages{
    
    return [_imageDict count];
    
}
-(NSString*)getImageNameForIndex:(NSInteger)index{
    
    return _imageNames[index];
}


@end
