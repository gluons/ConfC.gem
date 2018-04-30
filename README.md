# ConfC
[![license](https://img.shields.io/github/license/gluons/ConfC.gem.svg?style=flat-square)](./LICENSE)
[![Gem](https://img.shields.io/gem/v/confc.svg?style=flat-square)](https://rubygems.org/gems/confc)
[![Gem](https://img.shields.io/gem/dt/confc.svg?style=flat-square)](https://rubygems.org/gems/confc)
[![Libraries.io for GitHub](https://img.shields.io/librariesio/github/gluons/ConfC.gem.svg?style=flat-square)](https://libraries.io/github/gluons/ConfC.gem)
[![Travis](https://img.shields.io/travis/gluons/ConfC.gem.svg?style=flat-square)](https://travis-ci.org/gluons/ConfC.gem)

**Config Clone** — 🆕 Start new project with your default configs.

Clone your default configuration files to current working directory.

## Installation

```bash
gem install confc
```

## Usage

```
Usage: confc [options] [filenames...]

Clone your default configuration files to current working directory.
    -p, --path [PATH]                Path to configuration files
    -f, --overwrite                  Force to overwrite
    -y, --yes                        Say yes without inquiry
    -v, --verbose                    Display more information
    -V, --version                    Show version number
    -h, --help                       Show help
```

## Configuration

You can configure **ConfC** via `.confcrc`, `.confcrc.json`, `.confcrc.yml` or `.confcrc.yaml` file.  
More information about configuration file can be found from [mysticonfig](https://git.io/mysticonfig).

### .confcrc
 - **path**  
   Type: `String`  
   Default: **$HOME** (Your **home** directory)

   Path to directory that contain your default configuration files.

 - **files**  
   Type: `Array<String>`  
   Default: Files name in [files.yaml](./files.yaml)

   List of target files name that you want to clone.

   > If you have your own configuration files and don't want to use files from [files.yaml](./files.yaml), just replace it with your files name by this option.

 - **overwrite**  
   Type: `Boolean`  
   Default: `false`
   
   Force to overwrite files if it exists.

 - **verbose**  
   Type: `Boolean`  
   Default: `false`

   Display verbose information.

## Related

- [ConfC](https://github.com/gluons/ConfC) - 🆕 Start new project with your default configs. (Node.js version)
