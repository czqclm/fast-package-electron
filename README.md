[中文](https://github.com/czqclm/fast-package-electron/blob/main/README_CN.md)
> Since Electron has strict environmental requirements, including but not limited to node version, npm version, and dependencies on wine and wine64, upgrading and migrating become very difficult.

Runtime environment requirements: Docker.

# Building Images
> Please go to a machine with a better network environment, such as an overseas VPS server, to build images, as errors may occur when packaging in China (mainly due to dependencies on wine and Electron). If you don't want to build it yourself, please see the "Executing Packaging" section, where you can use the "czqclm/fast-package-electron:22-wine" image I have built.

Project Address: https://github.com/czqclm/fast-package-electron

Pull the project files.
```bash
git clone https://github.com/czqclm/fast-package-electron
```
Execute a local image build.
```bash
docker build -t fast-package-electron:22-wine . 
```
# Executing Packaging
Go to the directory where you want to package (with "index.html" at the same level), and execute the following command. Replace `$(pwd)` with the directory you want to package, such as `/root/project`.

```bash
docker run --rm --name my_container \
-v $(pwd):/project \
fast-package-electron:22-wine \
/bin/sh -c "cp -r /package_lib/node_modules /project && cd /project && npm run package_win64"
```

If packaging is successful, you can find the desired files in the "app-win32-x64" directory.

Of course, you can use the image I have packaged.

Docker Hub: https://hub.docker.com/r/czqclm/fast-package-electron
```bash
docker run --rm --name my_container \
-v $(pwd):/project \
czqclm/fast-package-electron:22-wine \
/bin/sh -c "cp -r /package_lib/node_modules /project && cd /project && npm run package_win64"
```
