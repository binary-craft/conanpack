# Cloud Native Buildpack for C and C++ with Conan
[![Build](https://github.com/pim-huisman/conanpack/actions/workflows/build.yml/badge.svg)](https://github.com/pim-huisman/conanpack/actions/workflows/build.yml)

## About
This project is used to create a Cloud Native Buildpack for Conan that can be used for native applications such as C and C++.

## Using the buildpack
The published buildpack will be made available on Docker hub. This project contains the source and is used to build it.

See [Docker hub](https://hub.docker.com/r/pimhuisman/conanpack).

```docker pull pimhuisman/conanpack:0.1.0```

## Building images with the buildpack
There are two options for using this buildpack:
- Using a builder image that includes it, for example [pim-huisman/cppbuilder](https://github.com/pim-huisman/cppbuilder).
- Adding it directly on the commandline, this can be done like follows:

```pack build my-app -b pimhuisman/conanpack:0.1.0```

### Arguments to pass to the build script
The buildpack has some environment variables / arguments that can be set to customise the build.

| Variable        | Description                                   | Default value                                    |
|-----------------|-----------------------------------------------|--------------------------------------------------|
| BUILD_ARGS      | Build arguments to pass to Conan              | `-b missing -s compiler.cppstd=$COMPILER_CPPSTD` |
| COMPILER_CPPSTD | Compiler std to set in default build argument | gnu23                                            |

### Compiler choice
Conan will choose a default compiler depending on the environment. You can override this by setting the option `-s compiler=gcc` if you want to use GCC, for example.

Also see [the Conan documentation](https://opensource.apple.com/source/clang/clang-23/clang/tools/clang/www/comparison.html#gcc) for more information about these settings.

## Maintaining
This project is aimed to have a straightforward maintenance by using all relevant automation that we can. Automation is used for:
- Building and pushing the images on any relevant changes to the `main` branch.
- Checking for upstream Ubuntu LTS updates and automatically integrating them
- Snyk vulnerability scanning

### Dependency versions
#### Ubuntu LTS
Within the same LTS version there is an automation in place to automatically upgrade to the latest patch and/or minor version.
If a new Ubuntu LTS (with a major version change) is published this is considered a breaking change, such releases will get their own tags in line with Ubuntu Docker image tagging strategy.

#### APT packages
APT packages will be automatically updated on rebuild to their latest versions suitable for the Ubuntu LTS release in use.

#### CMake, Conan
Pinning is done on major versions. Any patch and/or minor updates will be automatically applied on rebuild.

## Contributing
This project is open for any contributions that you might have. Bugfixes and feature enhancements are very welcome.

If you'd like to implement a major new feature or change some fundamentals of the project please send me a DM to discuss.

## License
This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the full license text.