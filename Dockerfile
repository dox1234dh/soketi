# Sử dụng base image Node.js Alpine để giảm dung lượng xuống mức tối thiểu (~150MB)
FROM node:18-alpine

# Cài đặt các công cụ build cần thiết để biên dịch thư viện C (như uWebSockets)
RUN apk add --no-cache python3 make g++

# Cài đặt phiên bản mới nhất của Soketi
RUN npm install -g @soketi/soketi

# Chuyển sang user 'node' có sẵn để tuân thủ bảo mật khắt khe của Kubernetes (Non-root user)
USER node

# Cổng mặc định
EXPOSE 6001

# Lệnh chạy mặc định
CMD ["soketi", "start"]
