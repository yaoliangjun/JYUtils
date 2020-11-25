//
//  UIDevice+JYExtension.m
//  JYUtils
//
//  Created by Jerry on 2020/11/25.
//

#import "UIDevice+JYExtension.h"
#import <sys/utsname.h>

@implementation UIDevice (JYExtension)

/** 判断设备是否是在充电中 */
+ (BOOL)isCharging {
    // Get the device
    UIDevice *Device = [UIDevice currentDevice];
    // Set battery monitoring on
    Device.batteryMonitoringEnabled = YES;
    
    // Check the battery state
    if ([Device batteryState] == UIDeviceBatteryStateCharging ||
        [Device batteryState] == UIDeviceBatteryStateFull) {
        // Device is charging
        return YES;
        
    } else {
        // Device is not charging
        return NO;
    }
}

/** 获取电池电量 */
+ (float)batteryLevel {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    return [UIDevice currentDevice].batteryLevel;
}

/** 获取手机机型 */
+ (NSString *)deviceName {
    // 具体值可参考：https://www.theiphonewiki.com/wiki/Models
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    // Simulator
    if ([deviceString isEqualToString:@"i386"])
        return @"Simulator";
    else if ([deviceString isEqualToString:@"x86_64"])
        return @"Simulator";
    
    // iPhone
    else if ([deviceString isEqualToString:@"iPhone1,1"])
        return @"iPhone 1G";
    else if ([deviceString isEqualToString:@"iPhone1,2"])
        return @"iPhone 3G";
    else if ([deviceString isEqualToString:@"iPhone2,1"])
        return @"iPhone 3GS";
    else if ([deviceString isEqualToString:@"iPhone3,1"])
        return @"iPhone 4";
    else if ([deviceString isEqualToString:@"iPhone3,2"])
        return @"Verizon iPhone 4";
    else if ([deviceString isEqualToString:@"iPhone4,1"])
        return @"iPhone 4S";
    else if ([deviceString isEqualToString:@"iPhone5,1"])
        return @"iPhone 5";
    else if ([deviceString isEqualToString:@"iPhone5,2"])
        return @"iPhone 5";
    else if ([deviceString isEqualToString:@"iPhone5,3"])
        return @"iPhone 5C";
    else if ([deviceString isEqualToString:@"iPhone5,4"])
        return @"iPhone 5C";
    else if ([deviceString isEqualToString:@"iPhone6,1"])
        return @"iPhone 5S";
    else if ([deviceString isEqualToString:@"iPhone6,2"])
        return @"iPhone 5S";
    else if ([deviceString isEqualToString:@"iPhone7,1"])
        return @"iPhone 6 Plus";
    else if ([deviceString isEqualToString:@"iPhone7,2"])
        return @"iPhone 6";
    else if ([deviceString isEqualToString:@"iPhone8,1"])
        return @"iPhone 6s";
    else if ([deviceString isEqualToString:@"iPhone8,2"])
        return @"iPhone 6s Plus";
    else if ([deviceString isEqualToString:@"iPhone8,4"])
        return @"iPhone SE";
    else if ([deviceString isEqualToString:@"iPhone9,1"])
        return @"iPhone 7";
    else if ([deviceString isEqualToString:@"iPhone9,3"])
        return @"iPhone 7";
    else if ([deviceString isEqualToString:@"iPhone9,4"])
        return @"iPhone 7 plus";
    else if ([deviceString isEqualToString:@"iPhone9,2"])
        return @"iPhone 7 plus";
    else if ([deviceString isEqualToString:@"iPhone10,1"])
        return @"iPhone 8";
    else if ([deviceString isEqualToString:@"iPhone10,4"])
        return @"iPhone 8";
    else if ([deviceString isEqualToString:@"iPhone10,5"])
        return @"iPhone 8 plus";
    else if ([deviceString isEqualToString:@"iPhone10,2"])
        return @"iPhone 8 plus";
    else if ([deviceString isEqualToString:@"iPhone10,3"])
        return @"iPhone X";
    else if ([deviceString isEqualToString:@"iPhone10,6"])
        return @"iPhone X";
    else if ([deviceString isEqualToString:@"iPhone11,8"])
        return @"iPhone XR";
    else if ([deviceString isEqualToString:@"iPhone11,2"])
        return @"iPhone XS";
    else if ([deviceString isEqualToString:@"iPhone11,6"])
        return @"iPhone XS MAX";
    else if ([deviceString isEqualToString:@"iPhone12,1"])
        return @"iPhone 11";
    else if([deviceString isEqualToString:@"iPhone12,3"])
        return @"iPhone 11 Pro";
    else if([deviceString isEqualToString:@"iPhone12,5"])
        return @"iPhone 11 Pro Max";
    else if ([deviceString isEqualToString:@"iPhone12,8"])
        return @"iPhone SE2";
    else if ([deviceString isEqualToString:@"iPhone13,1"])
        return @"iPhone 12 mini";
    else if ([deviceString isEqualToString:@"iPhone13,2"])
        return @"iPhone 12";
    else if ([deviceString isEqualToString:@"iPhone13,3"])
        return @"iPhone 12 Pro";
    else if ([deviceString isEqualToString:@"iPhone13,4"])
        return @"iPhone 12 Pro Max";
    
    // iPad
    else if ([deviceString isEqualToString:@"iPad1,1"])
        return @"iPad";
    else if ([deviceString isEqualToString:@"iPad2,1"])
        return @"iPad 2 (WiFi)";
    else if ([deviceString isEqualToString:@"iPad2,2"])
        return @"iPad 2 (GSM)";
    else if ([deviceString isEqualToString:@"iPad2,3"])
        return @"iPad 2 (CDMA)";
    else if ([deviceString isEqualToString:@"iPad2,4"])
        return @"iPad 2 (32nm)";
    else if ([deviceString isEqualToString:@"iPad2,5"])
        return @"iPad mini (WiFi)";
    else if ([deviceString isEqualToString:@"iPad2,6"])
        return @"iPad mini (GSM)";
    else if ([deviceString isEqualToString:@"iPad2,7"])
        return @"iPad mini (CDMA)";
    else if ([deviceString isEqualToString:@"iPad3,1"])
        return @"iPad 3(WiFi)";
    else if ([deviceString isEqualToString:@"iPad3,2"])
        return @"iPad 3(CDMA)";
    else if ([deviceString isEqualToString:@"iPad3,3"])
        return @"iPad 3(4G)";
    else if ([deviceString isEqualToString:@"iPad3,4"])
        return @"iPad 4 (WiFi)";
    else if ([deviceString isEqualToString:@"iPad3,5"])
        return @"iPad 4 (4G)";
    else if ([deviceString isEqualToString:@"iPad3,6"])
        return @"iPad 4 (CDMA)";
    else if ([deviceString isEqualToString:@"iPad4,1"])
        return @"iPad Air";
    else if ([deviceString isEqualToString:@"iPad4,2"])
        return @"iPad Air";
    else if ([deviceString isEqualToString:@"iPad4,3"])
        return @"iPad Air";
    else if ([deviceString isEqualToString:@"iPad5,3"])
        return @"iPad Air 2";
    else if ([deviceString isEqualToString:@"iPad5,4"])
        return @"iPad Air 2";
    else if ([deviceString isEqualToString:@"i386"])
        return @"Simulator";
    else if ([deviceString isEqualToString:@"x86_64"])
        return @"Simulator";
    else if ([deviceString isEqualToString:@"iPad4,4"] || [deviceString isEqualToString:@"iPad4,5"] || [deviceString isEqualToString:@"iPad4,6"])
        return @"iPad mini 2";
    else if ([deviceString isEqualToString:@"iPad4,7"] || [deviceString isEqualToString:@"iPad4,8"] || [deviceString isEqualToString:@"iPad4,9"])
        return @"iPad mini 3";
    else if ([deviceString isEqualToString:@"iPad5,1"] || [deviceString isEqualToString:@"iPad5,2"])
        return @"iPad mini 4";
    else if ([deviceString isEqualToString:@"iPad6,7"])
        return @"iPad Pro (12.9-inch)";
    else if ([deviceString isEqualToString:@"iPad6,8"])
        return @"iPad Pro (12.9-inch)";
    else if ([deviceString isEqualToString:@"iPad6,3"])
        return @"iPad Pro (9.7-inch)";
    else if ([deviceString isEqualToString:@"iPad6,4"])
        return @"iPad Pro (9.7-inch)";
    else if ([deviceString isEqualToString:@"iPad6,11"])
        return @"iPad(5G)";
    else if ([deviceString isEqualToString:@"iPad6,12"]) return @"iPad(5G)";
    else if ([deviceString isEqualToString:@"iPad7,2"])  return @"iPad Pro (12.9-inch, 2g)";
    else if ([deviceString isEqualToString:@"iPad7,1"]) return @"iPad Pro(12.9-inch, 2g)";
    else if ([deviceString isEqualToString:@"iPad7,3"]) return @"iPad Pro (10.5-inch)";
    else if ([deviceString isEqualToString:@"iPad7,4"]) return @"iPad Pro (10.5-inch)";
    
    else return @"Unknown";
}

/** 获取手机存储 */
+ (int)storage {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *totalSpace = fileSysAttributes[NSFileSystemSize];
    CGFloat size = [totalSpace floatValue] / 1024.0 / 1024.0 / 1024.0;

    if (size <= 8.0) {
        return 8;
    } else if (size <= 16.0) {
        return 16;
    } else if (size <= 32.0) {
        return 32;
    } else if (size <= 64.0) {
        return 64;
    } else if (size <= 128.0) {
        return 128;
    } else if (size <= 256.0) {
        return 256;
    } else if (size <= 512.0) {
        return 512;
    } else if (size <= 1024.0) {
        return 1024;
    } else if (size <= 2048.0) {
        return 2048;
    } else {
        return (int)size;
    }
}


@end
