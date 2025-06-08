# 🚌 BUS TIME  
### (종/기점 정류장에서의 남은시간 표시 앱)

---

## 🔗 주소

- **GitHub**: [https://github.com/gwondev/bustime.git](https://github.com/gwondev/bustime.git)  
- **앱 주소 (Firebase Web Hosting)**: [https://bustime-22c77.web.app](https://bustime-22c77.web.app)

---

## 📝 개요

- **개발 기간**: 2024.06 ~ 2024.08 (개발) + 2025.06 (문서화 및 배포)
- **총 소요 기간**: 약 3개월 개발 + 1개월 정리
- **앱 이름**: BUS TIME

**개발 목적**  
제가 다녔던 조선대학교의 교내에는 "조선대학교 해오름관"이라는 종점/기점 정류장이 있습니다.  
그러나 종점 특성상 **네이버 지도, 카카오맵 등에서는 남은 시간 표시가 되지 않는 문제**가 있었습니다.  
이를 해결하고자, 버스 시간표를 **Firestore DB에 수동 등록**한 후,  
실시간으로 각 버스의 **남은 도착 시간**을 보여주는 앱을 Flutter로 직접 제작하였습니다.

---

## 🧱 아키텍처

아래는 전체 구조를 설명하는 시스템 아키텍처입니다:

![image](https://github.com/user-attachments/assets/b17a0430-e33d-4d9a-93eb-d690c2014ea3)


- **Flutter**: 프론트엔드 앱 제작
- **Firebase Firestore**: 버스 시간표 저장
- **Firebase Authentication**: 인증 처리 (보안 룰 기반 접근 제어 가능)
- **Firebase Hosting**: 웹 서비스 제공
- **광주광역시 버스행정정보**: Firestore에 수동 등록된 버스 시간표의 출처

---

## ⚙ 구현 개요

- Flutter로 개발된 앱으로 `.apk` 파일 릴리즈까지 완료되어 **안드로이드  배포 준비 완료** 상태입니다.
- 추후 iOS 개발자 계정 생성 시 **iOS 앱스토어 배포도 가능**합니다.
- 크로스플랫폼 앱이므로 **Web / Android / iOS** 3개 플랫폼 모두에 대응 가능한 구조입니다.
- Firestore에 등록된 시간표를 기준으로 **현재 시간과 비교하여 실시간 남은 시간(분/초)을 표시**합니다.
- **평일/휴일 자동 판별 기능** 포함

---

## 구현 사진
![image](https://github.com/user-attachments/assets/a7db19bd-17f7-42f5-9e4b-7ac7f4ebde8e)

