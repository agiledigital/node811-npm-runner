# Node 8.11 NPM Runner
This is an alpine based image with libraries and tools installed for running NodeJS 8.11 *web* apps.

Expects build artifacts mounted at /home/runner/artifacts, with a package.json configured such that `http-server` runs the app.

As mentioned before that this runner serves static web apps on HTTPS, so it requires the private key and certificate under /home/runner. 

It uses default location for the certificates as described in https://github.com/indexzero/http-server#available-options
