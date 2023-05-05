# ---- Production ----
FROM node:18-alpine AS production

RUN npm install yarn -g

WORKDIR /dist

# COPY .next ./.next
COPY public ./public
COPY package*.json ./
COPY next.config.js ./next.config.js

# use npm ci for production
RUN npm install --omit=dev

RUN yarn build

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["yarn", "start"]
