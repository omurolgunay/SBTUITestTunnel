// SBTUITestTunnel.m
//
// Copyright (C) 2016 Subito.it S.r.l (www.subito.it)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#if DEBUG

#import "SBTUITestTunnel.h"

const double SBTUITunnelStubsDownloadSpeedGPRS   =-    56 / 8; // kbps -> KB/s
const double SBTUITunnelStubsDownloadSpeedEDGE   =-   128 / 8; // kbps -> KB/s
const double SBTUITunnelStubsDownloadSpeed3G     =-  3200 / 8; // kbps -> KB/s
const double SBTUITunnelStubsDownloadSpeed3GPlus =-  7200 / 8; // kbps -> KB/s
const double SBTUITunnelStubsDownloadSpeedWifi   =- 12000 / 8; // kbps -> KB/s

NSString * const SBTUITunneledApplicationLaunchOptionResetFilesystem = @"SBTUITunneledApplicationLaunchOptionResetFilesystem";
NSString * const SBTUITunneledApplicationLaunchOptionInhibitCoreLocation = @"SBTUITunneledApplicationLaunchOptionInhibitCoreLocation";
NSString * const SBTUITunneledApplicationLaunchOptionDisableUITextFieldAutocomplete = @"SBTUITunneledApplicationLaunchOptionDisableUITextFieldAutocomplete";
NSString * const SBTUITunneledApplicationLaunchEnvironmentBonjourNameKey = @"SBTUITunneledApplicationLaunchEnvironmentBonjourNameKey";
NSString * const SBTUITunneledApplicationLaunchEnvironmentRemotePortKey = @"SBTUITunneledApplicationLaunchEnvironmentRemotePortKey";
NSString * const SBTUITunneledApplicationLaunchOptionHasStartupCommands = @"SBTUITunneledApplicationLaunchOptionHasStartupCommands";

NSString * const SBTUITunnelHTTPMethod = @"POST";

NSString * const SBTUITunnelStubQueryRuleKey = @"rule";
NSString * const SBTUITunnelStubQueryReturnDataKey = @"ret_data";
NSString * const SBTUITunnelStubQueryReturnCodeKey = @"ret_code";
NSString * const SBTUITunnelStubQueryIterations = @"iterations";
NSString * const SBTUITunnelStubQueryResponseTimeKey = @"time_response";
NSString * const SBTUITunnelStubQueryMimeTypeKey = @"mime_type";

NSString * const SBTUITunnelProxyQueryRuleKey = @"rule";
NSString * const SBTUITunnelProxyQueryResponseTimeKey = @"time_response";

NSString * const SBTUITunnelObjectKey = @"obj";
NSString * const SBTUITunnelObjectKeyKey = @"key";

NSString * const SBTUITunnelUploadDataKey = @"data";
NSString * const SBTUITunnelUploadDestPathKey = @"dest";
NSString * const SBTUITunnelUploadBasePathKey = @"base";

NSString * const SBTUITunnelDownloadPathKey = @"path";
NSString * const SBTUITunnelDownloadBasePathKey = @"base";

NSString * const SBTUITunnelResponseResultKey = @"result";

NSString * const SBTUITunnelCustomCommandKey = @"cust_command";

NSString * const SBTUITunneledApplicationCommandStubPathThatMatchesRegex = @"commandStubPathThathMatchesRegex";
NSString * const SBTUITunneledApplicationCommandStubPathThatContainsQueryParams = @"commandStubPathThathContainsQueryParams";
NSString * const SBTUITunneledApplicationcommandStubAndRemovePathThatMatchesRegex = @"commandStubAndRemovePathThathMatchesRegex";
NSString * const SBTUITunneledApplicationcommandStubAndRemovePathThatContainsQueryParams = @"commandStubAndRemovePathThathContainsQueryParams";
NSString * const SBTUITunneledApplicationCommandstubRequestsRemove = @"commandStubRequestsRemove";
NSString * const SBTUITunneledApplicationcommandStubRequestsRemoveAll = @"commandStubRequestsRemoveAll";

NSString * const SBTUITunneledApplicationCommandMonitorPathThatMatchesRegex = @"commandMonitorPathThathMatchesRegex";
NSString * const SBTUITunneledApplicationCommandMonitorPathThatContainsQueryParams = @"commandMonitorPathThathContainsQueryParams";
NSString * const SBTUITunneledApplicationCommandMonitorRemove = @"commandMonitorRemove";
NSString * const SBTUITunneledApplicationcommandMonitorRemoveAll = @"commandMonitorsRemoveAll";
NSString * const SBTUITunneledApplicationcommandMonitorPeek = @"commandMonitorPeek";
NSString * const SBTUITunneledApplicationcommandMonitorFlush = @"commandMonitorFlush";

NSString * const SBTUITunneledApplicationCommandThrottlePathThatMatchesRegex = @"commandThrottlePathThathMatchesRegex";
NSString * const SBTUITunneledApplicationCommandThrottlePathThatContainsQueryParams = @"commandThrottlePathThathContainsQueryParams";
NSString * const SBTUITunneledApplicationCommandThrottleRemove = @"commandThrottleRemove";
NSString * const SBTUITunneledApplicationcommandThrottleRemoveAll = @"commandThrottlesRemoveAll";

NSString * const SBTUITunneledApplicationCommandNSUserDefaultsSetObject = @"commandNSUserDefaultsSetObject";
NSString * const SBTUITunneledApplicationCommandNSUserDefaultsRemoveObject = @"commandNSUserDefaultsRemoveObject";
NSString * const SBTUITunneledApplicationCommandNSUserDefaultsObject = @"commandNSUserDefaultsObject";
NSString * const SBTUITunneledApplicationCommandNSUserDefaultsReset = @"commandNSUserDefaultsReset";

NSString * const SBTUITunneledApplicationCommandKeychainSetObject = @"commandKeychainSetObject";
NSString * const SBTUITunneledApplicationCommandKeychainRemoveObject = @"commandKeychainRemoveObject";
NSString * const SBTUITunneledApplicationCommandKeychainObject = @"commandKeychainObject";
NSString * const SBTUITunneledApplicationCommandKeychainReset = @"commandKeychainReset";

NSString * const SBTUITunneledApplicationCommandCustom = @"commandCustom";

NSString * const SBTUITunneledApplicationCommandSetUserInterfaceAnimations = @"commandSetUIAnimations";

NSString * const SBTUITunneledApplicationCommandUploadData = @"commandUpload";
NSString * const SBTUITunneledApplicationCommandDownloadData = @"commandDownload";

NSString * const SBTUITunneledApplicationCommandShutDown = @"commandShutDown";

NSString * const SBTUITunneledApplicationCommandStartupCommandsCompleted = @"commandStartupCompleted";

NSString * const SBTUITunneledNSURLProtocolHTTPBodyKey = @"SBTUITunneledNSURLProtocolHTTPBodyKey";

@implementation SBTUITunnelStartupCommand

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.path = [decoder decodeObjectForKey:@"path"];
        self.headers = [decoder decodeObjectForKey:@"headers"];
        self.query = [decoder decodeObjectForKey:@"query"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.path forKey:@"path"];
    [encoder encodeObject:self.headers forKey:@"headers"];
    [encoder encodeObject:self.query forKey:@"query"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"path: %@\nheaders: %@\nquery: %@\n", self.path, self.headers, self.query];
}

@end

@implementation SBTMonitoredNetworkRequest : NSObject

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.timestamp = [[decoder decodeObjectForKey:@"timestamp"] doubleValue];
        self.requestTime = [[decoder decodeObjectForKey:@"requestTime"] doubleValue];
        self.request = [decoder decodeObjectForKey:@"request"];
        self.originalRequest = [decoder decodeObjectForKey:@"originalRequest"];
        self.response = [decoder decodeObjectForKey:@"response"];
        self.responseData = [decoder decodeObjectForKey:@"responseData"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:@(self.timestamp) forKey:@"timestamp"];
    [encoder encodeObject:@(self.requestTime) forKey:@"requestTime"];
    [encoder encodeObject:self.request forKey:@"request"];
    [encoder encodeObject:self.originalRequest forKey:@"originalRequest"];
    [encoder encodeObject:self.response forKey:@"response"];
    [encoder encodeObject:self.responseData forKey:@"responseData"];
}

- (NSString *)responseString
{
    NSString *ret = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    
    if (!ret) {
        ret = [[NSString alloc] initWithData:self.responseData encoding:NSASCIIStringEncoding];
    }
    
    return ret;
}

- (id)responseJSON
{
    NSError *error = nil;
    NSDictionary *ret = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableContainers error:&error];
    
    return (ret && !error) ? ret : nil;
}

@end

#endif
