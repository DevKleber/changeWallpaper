#!/bin/bash

# Function to extract the image URL from the Bing RSS feed
get_image_url() {
    local rss_url="https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US"
    local image_url=$(curl -s "$rss_url" | grep -oPm1 "(?<=<url>)[^<]+")
    echo "https://www.bing.com$image_url"
}

# Function to extract the image description from the Bing RSS feed
get_image_description() {
    local rss_url="https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US"
    local image_description=$(curl -s "$rss_url" | grep -oPm1 "(?<=<title>)[^<]+")
    echo "$image_description"
}

# Function to download the image and save it to a file
download_image() {
    local image_url=$(get_image_url)
    local image_description=$(get_image_description)
    local file_name="$(date +"%Y-%m-%d")_bing_image.jpg"

    echo "Downloading Bing Image of the Day..."
    echo "Description: $image_description"
    echo "Image URL: $image_url"
    echo "Saving as: $file_name"

    curl -s "$image_url" -o "$file_name"

    echo "Download complete!"
}

# Call the download_image function
download_image
