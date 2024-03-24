# 기본 이미지로 node의 LTS(장기지원) 버전을 사용
FROM node:lts-alpine

# 앱 디렉토리 생성
WORKDIR /app

# 앱 의존성 설치
# package.json 과 yarn.lock 파일을 /app 디렉토리로 복사
COPY package.json yarn.lock ./

# 의존성 설치
RUN yarn install --frozen-lockfile

# 앱 소스 추가
COPY . .

# Next.js 앱 빌드
RUN yarn build

# 앱 실행을 위한 포트
EXPOSE 3000

# Next.js 앱 시작
CMD ["yarn", "start"]
