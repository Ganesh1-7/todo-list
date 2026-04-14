FROM node:18

WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all files (including server.js)
COPY . .

# Expose backend port
EXPOSE 5000

# Start server
CMD ["node", "server.js"]