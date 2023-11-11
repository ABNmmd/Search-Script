# FSA - OS1 Mini Projet - Directory and File Search Script

This bash script is designed to search for directories and/or files within a specified directory, with optional filters based on name and/or type.


## Table of contents

- [Usage](#Usage)
- [Parameters](#Parameters)
  - [Optional-Parameters](#Optional-Parameters)
- [Examples](#Examples)
    -[Search by Name](#search-by-name)
    -[Search by Type](#search-by-type)
    -[Search by Both Name and Type](#search-by-both-name-and-type)
- [Notes](#notes)
- [What I learned](#what-i-learned)
- [Useful resources](#useful-resources)
- [Author](#author)


## Usage

```bash
./search_script.sh <search_startAt> [ -name <target_name> OR -type <target_type> ]
```

## Parameters

- <search_startAt>: The starting directory for the search.
#### Optional-Parameters
- **-name <target_name>**: Search for items with a specific name.
- **-type <target_type>**: Filter items based on type ('f' for files, 'd' for directories).

## Examples

### Search by Name
```bash
./mini_prg.sh /path/to/search -name example_file.txt
```

### Search by Type
```bash
./mini_prg.sh /path/to/search -type d
```

### Search by Both Name and Type
```bash
./mini_prg.sh /path/to/search -name example_file.txt -type f
```

## Notes

- If only searching by name, the script will find all occurrences matching the specified name.
- If only searching by type, the script will find all files or directories based on the specified type.
- If searching by both name and type, the script will find items that match both criteria.

## Please ensure that the script has execute permissions:

```bash
chmod +x search_script.sh
```

## What I learned

In the process of creating this script, I learned:

- How to handle command-line arguments in a Bash script.
- Techniques for searching directories and filtering results based on name and type.
- Recursive function implementation for searching nested directories.

## Useful resources

- [Bash Scripting Guide](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/index.html) - A comprehensive guide for beginners in Bash scripting.
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) - The official GNU Bash reference manual.


## Author

- Linkedin - [Mohamed Abnoune](https://www.linkedin.com/in/mohamed-abnoune-863130294/)
- GitHub - [Mohamed Abnoune](https://github.com/ABNmmd)
- Frontend Mentor - [@ABNmmd](https://www.frontendmentor.io/profile/ABNmmd)