# DNS Speed Test Script

This repository contains a simple yet effective shell script designed to test DNS resolution speed across a list of predefined domains. It's compatible with macOS and Linux/Unix systems, automatically adapting the DNS cache clearing command based on the operating system. This tool is ideal for anyone looking to measure the performance of their DNS servers or compare the response times of different DNS providers.

## Features

- **OS Compatibility**: Works on both macOS and Linux/Unix systems.
- **Automatic DNS Cache Clearing**: Clears the DNS cache before running tests to ensure accurate measurement.
- **Customizable Domain List**: Comes with a predefined set of popular domains for testing, which users can easily modify to include additional domains.
- **Performance Evaluation**: Calculates and displays the average DNS query time, providing a simple assessment of DNS server performance.

## Requirements

- Bash shell
- `dig` command (part of the `bind-utils` or `dnsutils` package, depending on the distribution)
- `sudo` privileges for clearing the DNS cache

## Installation

Clone this repository to your local machine using:

```bash
git clone https://github.com/inabakumori/dns_speed_test.git
```

Navigate to the cloned directory:

```bash
cd dns_speed_test
```

Make the script executable:

```bash
chmod +x dns_speed_test.sh
```

## Usage

Run the script with:

```bash
./dns_speed_test.sh
```

You will be prompted for your password if the script needs to clear the DNS cache with `sudo` privileges.

## Customizing the Domain List

To customize the list of domains for the speed test, edit the `dns_speed_test.sh` script and modify the `domains` array near the top of the file. Add or remove domain names as needed.

Example:

```bash
declare -a domains=(
    "example.com"
    "anotherdomain.com"
    # Add more domains here...
)
```

## Contributing

Contributions to improve the script or extend its functionality are welcome. Please feel free to fork the repository, make your changes, and submit a pull request.

## Acknowledgments

- This script was inspired by the need for a simple, cross-platform tool to benchmark DNS server performance.
