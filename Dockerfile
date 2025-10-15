FROM node:24.9.1-alpine

# Create a non-root user and group
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs

# Set working directory inside the container
WORKDIR /app

# Copy package.json to install dependencies
COPY package.json .

# Install only production dependencies and clean cache to reduce size
RUN npm install --omit=dev && npm cache clean --force

# Copy app source code
COPY . .

# Change ownership of the app directory to the non-root user
RUN chown -R nodejs:nodejs /app

# Switch to non-root user
USER nodejs

# Start the app with a non-root user
CMD ["node", "index.js"]