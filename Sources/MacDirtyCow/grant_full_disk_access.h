//
//  grant_full_disk_access.h
//  Cowabunga
//
//  Created by lemin on 1/27/23.
//
#pragma once
@import Foundation;

#import <Foundation/Foundation.h>

#ifndef grant_full_disk_access_h
#define grant_full_disk_access_h

void grant_full_disk_access(void (^completion)(NSError* _Nullable));


#endif /* grant_full_disk_access_h */
/// Uses CVE-2022-46689 to grant the current app read/write access outside the sandbox.
void grant_full_disk_access(void (^_Nonnull completion)(NSError* _Nullable));
bool patch_installd(void);
