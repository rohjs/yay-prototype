# 함깨 하면 즐거운, Yay!


### 1. Yay!
저희의 목표는 명확합니다.  
웹 기술을 활용해 사람들의 생활에 편의를 가져다줄 서비스를 제작하는 것.  

전 세계가 경쟁적으로 정보화를 추진하고 정보화 정도가 곧 국가 경쟁력을 나타내는 오늘날, 국가 간 정보 격차로 점차 글로벌 사회에서 소외되어 가는 사람들에게 ICT 기술을 가르치는 것. 우리는 IT 봉사 활동을 통해 사람들의 삶에 의미 있고 긍정적인 변화를 일으키고자 합니다. 

### 2. Our Team
* 팀장/개발: 서강대학교 Art&Technology / 노우현
* 개발: 서강대학교 경영학 & 컴퓨터 공학 / 이찬하
* 언어(스페인어): 서강대학교 국제한국학 / 김상아
* 문화: 서강대학교 경영학 / 곽형민

### 3. Yayboard Prototype
![dashboard - my courses 01](https://user-images.githubusercontent.com/19285811/39503015-697c20b4-4dfe-11e8-8268-f2907e23ceed.jpg)

![dashboard - my courses 00](https://user-images.githubusercontent.com/19285811/39503014-694a41ac-4dfe-11e8-8f27-5469324f1c65.jpg)

### 4. How to Start

#### 1. 개발환경 설정
bundle을 설치하세요. Rails가 로컬에 설치가 되어 있지 않으신 분들은 [Install Rails](http://installrails.com/)를 참고하여 Ruby와 Rails를 설치해주세요.

```bash
$ cd yay-prototype
$ gem install bundle
$ bundle i
```

#### 2. 데이터베이스 생성
개발환경이 세팅이 되면 다음의 커맨드를 순서대로 입력해주세요. DB를 생성하고 마이그레이션을 해줍니다.
```bash
$ rake db:create
# Created database 'db/development.sqlite3'
# Created database 'db/test.sqlite3'

$ rake db:migrate
# == 20180425043748 DeviseCreateUsers: migrating ================================
# -- create_table(:users)
#    -> 0.0015s
# ...
```

#### 3. 시드 생성
테스팅을 위한 시드를 생성해줍니다.

```bash
$ rake db:seed
# A course is created!
# ...
```

#### 4. 레일즈 프로젝트 시작
마지막으로 레일즈 서버를 실행시킵니다. 

```bash
$ rails s
# http://localhost:3000
```

이때 다른 포트로 서버를 시작하고 싶다면 `-p PORT_NUMBER`를 추가해주시면 됩니다.
```bash
$ rails s -p 8080
# http://localhost:8080
```