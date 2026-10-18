FROM node:24-bookworm-slim
WORKDIR /workspace
COPY package.json package-lock.json ./
COPY . .
CMD ["sh", "-c", "exec npm run dev -- --host 0.0.0.0 --port 5173 --strictPort"]
