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
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import XCTest
@testable import MSAL
@_implementationOnly import MSAL_Private

final class MSALNativeAuthResetPasswordContinueIntegrationTests: MSALNativeAuthIntegrationBaseTests {

    private typealias Error = MSALNativeAuthResetPasswordContinueResponseError
    private var provider: MSALNativeAuthResetPasswordRequestProvider!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let context = MSALNativeAuthRequestContext(correlationId: correlationId)

        provider = MSALNativeAuthResetPasswordRequestProvider(
            config: config,
            requestConfigurator: MSALNativeAuthRequestConfigurator(),
            telemetryProvider: MSALNativeAuthTelemetryProvider()
        )

        sut = try provider.continue(
            parameters: MSALNativeAuthResetPasswordContinueRequestParameters(config: config,
                                                                             context: context,
                                                                             passwordResetToken: "<password-reset-token>",
                                                                             grantType: .oobCode,
                                                                             oobCode: "0000")
        )
    }

    func test_whenResetPasswordContinue_succeeds() async throws {
        try await mockAPIHandler.addResponse(
            endpoint: .resetPasswordContinue,
            correlationId: correlationId,
            responses: [.ssprContinueSuccess]
        )

        let response: MSALNativeAuthResetPasswordContinueResponse? = try await performTestSucceed()

        XCTAssertNotNil(response?.passwordSubmitToken)
        XCTAssertNotNil(response?.expiresIn)
    }

    func test_resetPasswordContinue_invalidClient() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .invalidClient,
            expectedError: Error(error: .invalidClient)
        )
    }

    func test_resetPasswordContinue_invalidGrant() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .invalidPurposeToken,
            expectedError: Error(error: .invalidRequest)
        )
    }

    func test_resetPasswordContinue_expiredToken() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .expiredToken,
            expectedError: Error(error: .expiredToken)
        )
    }

    func test_resetPasswordContinue_invalidPassword() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .invalidPassword,
            expectedError: Error(error: .invalidGrant, errorCodes: [.invalidCredentials])
        )
    }

    func test_resetPasswordContinue_invalidOOB() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .invalidOOBValue,
            expectedError: Error(error: .invalidOOBValue, errorCodes: [.invalidOTP])
        )
    }

    func test_resetPasswordContinue_verificationRequired() async throws {
        try await perform_testFail(
            endpoint: .resetPasswordContinue,
            response: .verificationRequired,
            expectedError: Error(error: .verificationRequired)
        )
    }
}
