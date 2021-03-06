//
//  Face2DApp.m
//  MagicFace
//
//  Created by silence on 5/12/14.
//  Copyright (c) 2014 Magic3D. All rights reserved.
//

#import "Face2DApp.h"
#import "Face2D.h"
#import "Face2DObj.h"
#import "MagicObjectManager.h"

@interface Face2DApp()
{
    MagicApp::Face2DObj* mF2DObj;
}
@end

@implementation Face2DApp 

- (BOOL)Enter
{
    if (!MOMGR->IsObjExist("Face2DObj"))
    {
        MOMGR->InsertObj("Face2DObj", new MagicApp::Face2DObj);
    }
    mF2DObj = dynamic_cast<MagicApp::Face2DObj*>(MOMGR->GetObj("Face2DObj"));
    return YES;
}

- (BOOL)Exit
{
    return YES;
}

- (NSImage*)LoadImage:(NSString*)filePath
{
    NSImage* img = [[NSImage alloc] initWithContentsOfFile:filePath];
    NSBitmapImageRep* imgRep = [[img representations] objectAtIndex:0];
    [img layerContentsForContentsScale:[img recommendedLayerContentsScale:0]];
    NSSize imgSize = [imgRep size];
    NSLog(@"image size: %f, %f, %f\n", imgSize.width, imgSize.height, [img recommendedLayerContentsScale:0]);
    if (img == nil)
    {
        NSLog(@"image load failed: %s\n", [filePath UTF8String]);
    }
    else
    {
        NSLog(@"image load success: %s\n", [filePath UTF8String]);
    }
    return img;
}

@end
