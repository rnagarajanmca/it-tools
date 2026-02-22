# IT Tools - Enhanced Fork

A comprehensive collection of handy IT tools with many enhancements and additional features compared to the original.

## Features

- **192+ tools** from the original IT Tools project
- **95% of issues** from the original project resolved
- **Full UI translation** in multiple languages
- **Many new tools** not available in the original
- **Bug fixes and enhancements** throughout
- **Docker container** for easy deployment

## Quick Start

### Docker (Recommended)

```bash
docker run -d --name it-tools --restart unless-stopped -p 8080:8080 nagarajan/it-tools:latest
```

### Docker Compose

```yaml
services:
  it-tools:
    container_name: it-tools
    image: nagarajan/it-tools:latest
    pull_policy: always
    restart: unless-stopped
    ports:
      - 8080:8080
```

### Local Installation

```bash
sudo apt-get install python3 make g++ && \
git clone -b chore/all-my-stuffs https://github.com/rnagarajanmca/it-tools.git && \
cd it-tools/ && \
pnpm i --ignore-scripts && \
pnpm dev
```

## Container Images

- **Docker Hub**: `nagarajan/it-tools:latest`
- **GitHub Container Registry**: `ghcr.io/rnagarajanmca/it-tools:latest`

## Important Notes

### Port Change
The container now uses port **8080** instead of 80 (due to nginx-unprivileged base image). Update your port mappings from `8080:80` to `8080:8080`.

### HTTPS Recommendation
Some tools (like PGP encryption) require HTTPS/SSL for WebCrypto API. Enable HTTPS even for internal installations using Let's Encrypt with DNS Challenge.

## Customization

### Filter Tools
Mount `tools-filter.json` to `/usr/share/nginx/html` to filter available tools using regex patterns.

### Custom Home Content
Mount `home.custom.md` to `/usr/share/nginx/html` to add custom content to the home page.

### External Tools
Add custom external tools by mounting `external-tools.json` with tool definitions.

### Default Settings
Set default tool parameters and UI language by mounting `tools-settings.json`.

## Development

### Prerequisites
- Node.js 22+
- pnpm
- Python3, make, g++

### Setup
```bash
pnpm install --ignore-scripts
pnpm dev
```

### Create New Tool
```bash
pnpm run script:create:tool my-tool-name
```

## Links

- **GitHub Repository**: https://github.com/rnagarajanmca/it-tools
- **Live Demo**: https://sharevb-it-tools.vercel.app/
- **Docker Hub**: https://hub.docker.com/r/nagarajan/it-tools

## Contributors

Big thanks to all contributors who have helped improve this project!

[![contributors](https://contrib.rocks/image?repo=rnagarajanmca/it-tools&refresh=1)](https://github.com/rnagarajanmca/it-tools/graphs/contributors)

## License

GNU GPLv3 - See [LICENSE](LICENSE) file for details.