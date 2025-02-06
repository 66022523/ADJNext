# Build stage
FROM node:latest AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm run export

# Production stage
FROM nginx:latest
COPY --from=builder /app/out /usr/share/nginx/html
