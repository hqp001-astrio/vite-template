# Stage 1: Build
FROM node:22.17.0-alpine3.21 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Copy build output to a volume mount
FROM alpine
WORKDIR /output
COPY --from=builder /app/dist .

# This image now contains only built files in /output

