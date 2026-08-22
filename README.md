# Re-buntu

> ⚠️ **WARNING — BETA / UNSTABLE PROJECT**
>
> **Do not use Re-buntu as your main operating system right now**, especially if you are not familiar with Linux, coding, or software development. Re-buntu is an early beta project and may be **very unstable**, contain bugs, fail to boot, or cause unexpected problems. Test it in a **virtual machine or on non-critical hardware** instead.
>
> This project is under active development and should not be considered production-ready.

**Re-buntu** is an Ubuntu-based **RebuiltTux** Linux distribution.

## Build system

Re-buntu uses `live-build` to assemble a bootable Ubuntu-based live ISO. The project is designed so the image can be built locally or automatically with GitHub Actions.

### Local build

On an Ubuntu/Debian build machine, install the required tools:

```bash
sudo apt update
sudo apt install live-build debootstrap squashfs-tools xorriso
```

Then run:

```bash
chmod +x build.sh
./build.sh
```

The resulting ISO is placed in `dist/`.

You can select a different Ubuntu-style codename or architecture with environment variables, for example:

```bash
CODENAME=noble ARCH=amd64 ./build.sh
```

> The initial build system is experimental. Ubuntu/live-build compatibility may require adjustments as the project develops.

## Repository layout

```text
config/                  live-build customization
config/package-lists/    packages installed into the image
config/hooks/            build-time customization hooks
.github/workflows/       automated ISO builds
build.sh                 local build entry point
dist/                    generated ISO output (ignored by Git)
```

## Project goals

- Build a bootable Ubuntu-based RebuiltTux distribution
- Add RebuiltTux customization and branding
- Provide a reproducible build process
- Produce downloadable ISO artifacts from GitHub Actions
- Keep the project easy to modify and rebuild

## Status

🚧 **Early beta development** — the initial live-build system is now in place.

## Name

The distribution is named **Re-buntu**, combining its Ubuntu base with the RebuiltTux project identity.
