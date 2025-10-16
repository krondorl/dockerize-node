FROM node:24.10-alpine

# Set production as default environment
ARG NODE_ENV=production
# You can use --build-arg to override the default value of NODE_ENV
ENV NODE_ENV=$NODE_ENV

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
