# macOS in Docker

##### Built on the great work from [foxlet]

What this does: \
_Runs a macOS image on QEMU in a docker container, with VNC and SSH access_

## Setup

### Requirements:
 - Docker
 - A MacOS `.qcow2` image (You can build a new one using foxlet's [macOS-Simple-KVM tool])
 - A `BaseSystem.img` file (Convert it yourself from the .dmg, or use foxlet's [macOS-Simple-KVM tool])
 - The `ESP.qcow2` file from [macOS-Simple-KVM tool]
 - the `/firmware` folder from foxlet's [macOS-Simple-KVM tool]
 - KVM Capable Linux host with KVM enabled
     - (This probably won't run on Windows or Mac docker due to the docker shim using the kvm from the host system already)


### Quickstart
 - Clone the [macOS-Simple-KVM tool]: `git clone https://github.com/foxlet/macOS-Simple-KVM.git`
 - Clone this repo
 - Copy the `firmware` directory from the macOS-Simple-KVM tool and your .qcow2 image into this repository
 - Copy/Move your `BaseSystem.img` and `MyDisk.qcow2` image into this directory
 - Run `docker-compose up` 
 
 VNC will be available on localhost port 5900
 SSH will be available on localhost port 2222 (If turned on in the `Settings > Sharing > Remote Access` in your macOS image)


## Build Yourself

Docker build . -t macos-docker

Mount the following volumes:

 - ./MyDisk.qcow2:/macostools/MyDisk.qcow2
 - ./BaseSystem.img:/macostools/BaseSystem.img
 - ./ESP.qcow2:/macostools/ESP.qcow2
 - ./firmware:/macostools/firmware


[foxlet]: https://github.com/foxlet/macOS-Simple-KVM
[macOS-Simple-KVM tool]: https://github.com/foxlet/macOS-Simple-KVM
