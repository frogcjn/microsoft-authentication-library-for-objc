//------------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//------------------------------------------------------------------------------

#import "MSALTestCase.h"

@interface MSALAadAuthorityResolverTests : MSALTestCase

@end

@implementation MSALAadAuthorityResolverTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testValidatedAuthorityCache
{
    // Add valid authority
    
    // Add non valid authority
    
    // Check if valid authority returned
    
    // Check if non valid authority was not returned
    
    
}

- (void)testDefaultOpenOdConfigurationEndpoint
{
    // Test with host and tenant
    
    // Test with no host
    
    // Test with no tenant
}

- (void)testOpenIdConfigEndpointSucess
{
    /*
     [MSALTestSwizzle instanceMethod:@selector(openIDConfigurationEndpointForURL:userPrincipalName:validate:context:completionHandler:)
     class:[MSALAadAuthorityResolver class]
     block:(id)^(id obj, NSURL *authority,
     NSString *userPrincipalName,
     BOOL validate, id<MSALRequestContext> context,
     OpenIDConfigCallback completionHandler)

     */
}

- (void)testOpenIdConfigEndpointNoValidationNeeded
{
    // Swizzle defaultOpenId...
    
    
}

- (void)testOpenIdConfigEndpointInvalidResponse
{
    
    
}

- (void)testOpenIdConfigEndpointErrorResponse
{
    
    
}



- (void)testOpenIdConfigEndpointWithNoValidateSuccessTest
{
    
}

- (void)testOpenIdConfigEndpointWithNoValidateFailTest
{
    
}


@end
