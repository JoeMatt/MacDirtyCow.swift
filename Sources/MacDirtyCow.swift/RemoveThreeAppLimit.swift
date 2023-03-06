//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 3/6/23.
//

import Foundation
import MacDirtyCow
import os.log

public extension MDC {
	enum RemoveThreeAppLimitError: Error, LocalizedError {
		case underlyingError(_ error: Error)
		case installdPatchFailed
		public var errorDescription: String? {
			switch self {
			case .underlyingError(let underlyingError as LocalizedError): return underlyingError.errorDescription
			case .underlyingError(let underlyingError): return underlyingError.localizedDescription
			case .installdPatchFailed: return "Failed to patch installd."
			}
		}
	}

	func removeThreeAppLimit(completion: @escaping (Result<Bool, Error>) -> Void) {
		grant_full_disk_access { success, error in
			if let error = error {
				os_log("`grant_full_disk_access` error: %@`", type: .error, error.localizedDescription)
				completion(.failure(error))
				return
			}
			guard patch_installd() else {
				os_log("can't patch installd", type: .error)
				completion(.failure(RemoveThreeAppLimitError.installdPatchFailed))
				return
			}
			os_log("Successfully patched installd", type: .info)
			completion(.success(success))
		}
	}

	func removeThreeAppLimit() async throws -> Bool {
		return try await withCheckedThrowingContinuation { continuation in
			removeThreeAppLimit() { result in
				continuation.resume(with: result)
			}
		}
	}
}
