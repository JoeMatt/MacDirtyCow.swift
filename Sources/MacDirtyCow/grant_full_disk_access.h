//
//  grant_full_disk_access.h
//  Cowabunga
//
//  Created by lemin on 1/27/23.
//
@import Foundation;

/// Uses CVE-2022-46689 to grant the current app read/write access outside the sandbox.
void grant_full_disk_access(void (^_Nonnull completion)(BOOL success, NSError* _Nullable)) NS_SWIFT_ASYNC_THROWS_ON_FALSE(1) NS_SWIFT_ASYNC(1);
bool patch_installd(void);
