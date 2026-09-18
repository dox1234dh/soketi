# Sử dụng đúng bản Node 18 Alpine (Bản uWS của Soketi tương thích tốt nhất với Node 18)
FROM node:18-alpine

# Cài đặt đầy đủ các gói compiler thiết yếu để biên dịch uWebSockets.js
RUN apk add --no-cache python3 make g++ gcc libc-dev git

# Cấu hình để npm bỏ qua lỗi quyền khi cài đặt global bằng quyền root
RUN npm config set unsafe-perm true

# Tiến hành cài đặt Soketi
RUN npm install -g @soketi/soketi

# Chuyển quyền sang user 'node' để an toàn cho Kubernetes (Non-root)
USER node

# Mở cổng mặc định
EXPOSE 6001

# Lệnh khởi chạy
CMD ["soketi", "start"]
