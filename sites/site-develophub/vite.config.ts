import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  base: '/develophub/',
  plugins: [react()],
  ssr: {
    external: ['react', 'react-dom'],
  },
  build: {
    outDir: resolve(__dirname, 'site-develophub'),
    emptyOutDir: true,
    rollupOptions: {
      input: resolve(__dirname, 'index.html'),
    }
  }
})
