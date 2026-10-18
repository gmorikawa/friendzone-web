import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

const dockerDev = process.env.DOCKER_DEV === 'true'
const clientDomain = process.env.WEB_CLIENT_DOMAIN
if (dockerDev && !clientDomain) {
  throw new Error('WEB_CLIENT_DOMAIN is required for Docker development')
}

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: dockerDev ? {
    allowedHosts: [clientDomain!],
    watch: { usePolling: true, interval: 1000 },
  } : undefined,
})
