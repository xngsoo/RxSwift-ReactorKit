
# 프로젝트 한줄 요약
- 목적, 특징 1~2줄 정리
  
<br/>

# 데모
스크린샷 or gif

# 기능 설명
- **기능1**:
  - 기능1 설명

- **기능2**:
  - 기능2 설명

- **기능3**:
  - 기능3 설명

- **기능4**:
  - 기능4 설명

<br/>

# 트러블 슈팅

<br/>

# 기술 스택
<p align="left">
  <img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white"/>
  <img src="https://img.shields.io/badge/UIKit-2396F3?style=for-the-badge&logo=apple&logoColor=white"/>
  <img src="https://img.shields.io/badge/RxSwift-B7178C?style=for-the-badge&logo=reactivex&logoColor=white"/>
  <img src="https://img.shields.io/badge/ReactorKit-4B6C4B?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Alamofire-FF4949?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Kingfisher-3498DB?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/FlexLayout-1C1C1E?style=for-the-badge"/>
</p>

<br/>

# 프로젝트 구조
```plaintext
Rx+Reactor/
├── AppDelegate.swift                    # 앱 진입 지점
├── SceneDelegate.swift                  # 멀티윈도우 등 앱 씬 관리
│
├── View/                                # UI 관련 뷰(View, Cell 등)
│   ├── SearchViewController.swift       # 검색 화면의 ViewController (UI + 바인딩)
│   └── ImageCell.swift                  # 이미지 표시용 커스텀 셀
│
├── Reactor/                             # 상태/비즈니스 로직 (ReactorKit)
│   └── SearchReactor.swift              # 검색 화면의 Reactor
│
├── Network/                             # 네트워크 관련 계층 (API 호출 등)
│   ├── KakaoAPI.swift                   # 카카오 이미지 검색 API 요청 담당
│   └── APIService.swift                 # 공통 네트워크 처리(Alamofire 등)
│
├── Model/                               # 데이터 모델 정의
│   └── ImageSearchResult.swift          # 카카오 이미지 검색 결과 모델
│
├── Resources/                           # 앱 리소스(이미지, 런치스크린 등)
│   ├── Assets.xcassets                  # 앱 이미지/컬러 리소스
│   └── LaunchScreen.storyboard          # 런치 스크린
│
└── SupportingFiles/                     # 기타 앱 설정, 환경파일 등
    └── Info.plist                        # 앱 설정 파일
```
