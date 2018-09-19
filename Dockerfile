FROM microsoft/dotnet:2.1-sdk

# Configure the listening port to 80
ENV ASPNETCORE_URLS http://*:80

# Install Chrome and dependencies.
RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update && \
    apt-get install -y unzip openjdk-8-jre-headless xvfb libxi6 libgconf-2-4 google-chrome-stable coreutils && \
    rm -rf /var/lib/apt/lists/*

# Install ChromeDriver.
RUN wget -N http://chromedriver.storage.googleapis.com/$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE)/chromedriver_linux64.zip -P ~/
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN rm ~/chromedriver_linux64.zip
RUN mv -f ~/chromedriver /usr/local/bin/chromedriver
RUN chown root:root /usr/local/bin/chromedriver
RUN chmod 0755 /usr/local/bin/chromedriver

# Set the Working Directory
WORKDIR /app
