# Dockerfile development version
FROM ruby:3.2.2 AS forecast-development

# Install yarn
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
RUN npm install -g yarn

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
COPY . $INSTALL_PATH
RUN rm -rf node_modules vendor
RUN gem install rails bundler
RUN bundle install --jobs 20 --retry 5
RUN ls -al
RUN yarn install
RUN bin/webpack

# Start server
# CMD rails server -b 0.0.0.0
CMD foreman start -f Procfile.dev