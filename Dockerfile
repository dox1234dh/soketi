# Sử dụng base image Node 18 Alpine nhẹ và ổn định
FROM node:18-alpine

# Cài đặt các công cụ biên dịch mã nguồn cần thiết cho Alpine Linux
RUN apk add --no-cache python3 make g++ gcc libc-dev git

# Cài đặt Soketi bằng cách truyền cờ bypass quyền trực tiếp vào câu lệnh
RUN npm install -g @soketi/soketi --unsafe-perm=true

# Chuyển sang user node (non-root) để bảo mật an toàn tối đa cho Kubernetes
USER node

# Mở cổng mặc định
EXPOSE 6001

# Lệnh chạy máy chủ Soketi
CMD ["soketi", "start"]
