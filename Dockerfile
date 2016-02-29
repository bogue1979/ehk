FROM busybox

EXPOSE 8080
WORKDIR /slides

CMD ["/slides/present_linux_amd64", "-http", "0.0.0.0:8080", "-base", "/vendor" ]


ADD slides /slides/
ADD present_linux_amd64 /slides/
ADD static /vendor/static/
ADD templates /vendor/templates/
