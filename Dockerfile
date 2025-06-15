# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install full dependencies (incl. dev for tsc)
RUN npm ci

# Copy the rest of the app
COPY . .

# Build the app (needs tsc from devDependencies)
RUN npm run build

# Now prune devDependencies
RUN npm prune --production

# Expose the port
EXPOSE 8000

# Set environment
ENV NODE_ENV=production

# Start the app
CMD ["npm", "start"]`
