FROM nginx

COPY colors.json www/* /usr/share/nginx/html/
COPY dist/marshians-green/ /usr/share/nginx/html/
COPY marshians-green-inverted.svg /usr/share/nginx/html/images/logo.svg
COPY dist/ /usr/share/nginx/html/dist/
