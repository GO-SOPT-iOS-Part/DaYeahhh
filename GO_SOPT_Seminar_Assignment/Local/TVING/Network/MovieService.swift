//
//  MovieService.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/12.
//

import Foundation

import Alamofire

final class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    func getMovie(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let kindsOfMovieData = "top_rated?"
        let kindsOfMovieLanguage = "&language=en-US"
        let url = Config.baseURL + kindsOfMovieData + "api_key=" + Config.personalKey + kindsOfMovieLanguage
        let dataRequest = AF.request(url,
                                     method: .get)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ContentsDataModel.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
    
}
