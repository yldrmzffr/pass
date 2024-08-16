# Pass

Pass is a simple command-line tool that generates secure passwords. It's easy to install and use on both macOS and Linux.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Options](#options)
- [Examples](#examples)
- [Building from Source](#building-from-source)
- [Contributing](#contributing)
- [License](#license)

## Installation

You can install Pass with a single command:

```bash
bash <(curl -s https://raw.githubusercontent.com/yldrmzffr/pass/main/scripts/install.sh)
```

This command will:
1. Download the right version for your computer (macOS or Linux)
2. Install it in your home folder
3. Make it ready to use

After installation, you might need to restart your terminal or run:
```bash
source ~/.bashrc  # If you use Bash
```
or
```bash
source ~/.zshrc   # If you use Zsh
```

## Usage

To generate a password, use the `pass` command followed by options:

```bash
pass [options]
```

## Options

- `-l` or `--length`: Set the length of the password (default is 12)
- `-u` or `--uppercase`: Include uppercase letters
- `-w` or `--lowercase`: Include lowercase letters
- `-d` or `--digits`: Include numbers
- `-s` or `--special`: Include special characters

## Examples

1. Generate a password with default settings (12 characters, all types):
   ```bash
   pass
   ```

2. Generate a 16-character password with uppercase and lowercase letters:
   ```bash
   pass -l 16 -u -w
   ```

3. Generate an 8-character password with only numbers and special characters:
   ```bash
   pass -l 8 -d -s
   ```

4. Generate a 20-character password with all types of characters:
   ```bash
   pass -l 20 -u -w -d -s
   ```

## Building from Source

If you want to build Pass from source:

1. Make sure you have Go installed on your computer.
2. Clone this repository:
   ```bash
   git clone https://github.com/yldrmzffr/pass.git
   ```
3. Go to the project folder:
   ```bash
   cd pass
   ```
4. Build the project:
   ```bash
   ./scripts/build.sh
   ```
5. The built files will be in the `bin` folder.

## Contributing

We welcome contributions! Here's how you can help:

1. Fork the repository
2. Create a new branch for your feature
3. Make your changes
4. Submit a pull request

Please make sure to update tests as needed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
