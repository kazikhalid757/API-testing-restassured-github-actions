# # Use Maven with OpenJDK 11 as the base image
# FROM maven:3.8.8-eclipse-temurin-21

# # Set the working directory
# WORKDIR /usr/src/app

# # Install necessary packages
# RUN apt-get update \
#     && apt-get install -y \
#         firefox-esr \
#         wget \
#         bzip2 \
#         xvfb \
#         libdbus-glib-1-2 \
#     && rm -rf /var/lib/apt/lists/*

# # Install GeckoDriver v0.33.0
# RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz \
#     && tar -xzf geckodriver-v0.33.0-linux64.tar.gz -C /usr/local/bin/ \
#     && rm geckodriver-v0.33.0-linux64.tar.gz \
#     && chmod +x /usr/local/bin/geckodriver

# # Copy the pom.xml file and download dependencies
# COPY pom.xml ./
# RUN mvn dependency:resolve

# # Copy the rest of the application
# COPY . .

# # Start the Maven tests
# CMD ["mvn", "clean", "test"]


# Use Maven with OpenJDK 21 as the base image
FROM maven:3.8.8-eclipse-temurin-21

# Set the working directory
WORKDIR /usr/src/app

# Install necessary packages
RUN apt-get update \
    && apt-get install -y \
        firefox \
        wget \
        bzip2 \
        xvfb \
        libdbus-glib-1-2 \
    && rm -rf /var/lib/apt/lists/*

# Install GeckoDriver v0.33.0
RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.33.0/geckodriver-v0.33.0-linux64.tar.gz \
    && tar -xzf geckodriver-v0.33.0-linux64.tar.gz -C /usr/local/bin/ \
    && rm geckodriver-v0.33.0-linux64.tar.gz \
    && chmod +x /usr/local/bin/geckodriver

# Copy the pom.xml file and download dependencies
COPY pom.xml ./
RUN mvn dependency:resolve

# Copy the rest of the application
COPY . .

# Start the Maven tests
CMD ["mvn", "clean", "test"]
