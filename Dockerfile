FROM node:24-bookworm-slim
WORKDIR /workspace
COPY package.json package-lock.json ./
RUN npm ci --cache /opt/npm-cache --no-audit --no-fund
COPY . .
CMD ["sh", "-c", "npm ci --offline --cache /opt/npm-cache --no-audit --no-fund && exec npm run dev -- --host 0.0.0.0 --port 5173 --strictPort"]
