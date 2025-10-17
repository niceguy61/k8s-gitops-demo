FROM nginxinc/nginx-unprivileged:1.21-alpine
# 소스 코드 복사
COPY src/index.html /usr/share/nginx/html/index.html

# 포트 설정
EXPOSE 8080

# 헬스체크
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# nginx 실행
CMD ["nginx", "-g", "daemon off;"]