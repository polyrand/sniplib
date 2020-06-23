#!/usr/bin/env python3

import os
import sys
import re
import fileinput

# uncomment the next line and change the last 4 lines
# if you need to go faster
# from concurrent.futures import ThreadPoolExecutor


def recursive_files(path: str = "snips/"):
    """Yield all files recursively inside a folder."""
    for root, dirs, files in os.walk(path):
        # ignore hidden files
        for f in [f for f in files if not f[0] == "."]:
            yield os.path.join(root, f)


def sort_tags(file_path: str):
    """Open file and sort tags in first line."""
    pattern = re.compile("(\"{3}|'{3})(.*)(\"{3}|'{3})")
    print("path:", file_path)

    with fileinput.input(file_path, inplace=True) as f:
        for line in f:
            if f.isfirstline():
                # 1. strip, 2. match pattern and pick 2n group (tags)
                # 3. make list 4. sort list
                match = pattern.match(line.strip())

                if not match:
                    sys.stdout.write(line)
                    continue

                sorted_tags_list = sorted(match.group(2).split())

                # stdout is written to file
                # use print instead of stdout to keep newline
                print(f'"""{" ".join(sorted_tags_list)}"""')
            else:
                sys.stdout.write(line)


if __name__ == "__main__":
    for f in list(recursive_files()):
        sort_tags(f)

    # uncomment these lines too for threaded processing
    # with ThreadPoolExecutor(max_workers=8) as executor:
    #     future = executor.submit(sort_tags, list(recursive_files()))
