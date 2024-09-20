# PSAutomation

## Overview

PSAutomation is a collection of PowerShell scripts designed to automate various tasks and processes. This repository aims to simplify and streamline repetitive tasks, making your workflow more efficient.

## Features

- **Task Automation**: Automate routine tasks to save time and reduce errors.
- **Modular Scripts**: Easily reusable and customizable scripts.
- **Error Handling**: Robust error handling to manage unexpected situations gracefully.
- **Configuration Files**: Use JSON configuration files to set any requirements and parameters.

## Installation

To get started with PSAutomation, clone the repository to your local machine:

```sh
git clone https://github.com/AndrewTibbles/PSAutomation.git
```

## Usage

All scripts are intended to be run from main.ps1. Ensure you have the necessary configuration files in place before running the script.

Running the Script
Navigate to the directory containing main.ps1 and execute it using PowerShell:

cd PSAutomation
.\main.ps1

Configuration
The script uses JSON configuration files to set any requirements. Ensure your configuration files are correctly set up before running the script. Here is an example of a configuration file (config.json):

# JSON

{
"chromeInstallScriptPath": "C:\\Scripts\\chromeInstallScript.ps1",
"otherParameter": "value"
}
AI-generated code. Review and use carefully. More info on FAQ.
# Example
Here’s an example of how to use the script with a configuration file:

# Example usage of main.ps1

.\main.ps1 -ConfigPath "C:\Path\To\Your\config.json"

# Contributing
Contributions are welcome! Please follow these steps to contribute:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes.
Commit your changes (git commit -m 'Add new feature').
Push to the branch (git push origin feature-branch).
Open a pull request.
License
This project is licensed under the MIT License. See the LICENSE file for details.

# Contact
For any questions or suggestions, feel free to open an issue or contact me directly at [andrewtibbles@outlook.com].

Feel free to adjust any sections as needed. If you have any specific details you'd like to add or any other questions, let me know!