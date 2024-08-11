# -*- encoding: utf-8 -*-
"""
@File    :   demo.py
@Time    :   2023/12/19 11:11:58
@Author  :   GitOPEN
@Version :   1.0
@Contact :   gitopen@gmail.com
@License :   (C)Copyright 2021-2024
@Desc    :   None
"""


import os
import pandas as pd
import numpy as np
from tqdm import tqdm

from gitopenlib.utils import basics as gb
from gitopenlib.utils import files as gf
from gitopenlib.utils import nlp as gn
from gitopenlib.utils import wonders as gw
from gitopenlib.utils import others as go

LOG_ENABLE = True


def pts(msg):
    if LOG_ENABLE:
        gb.pts(msg)


def run_by_multiprocess_main(paths: list):
    for path in paths:
        pts(f"current path: {path}")
    pass


def run_by_multiprocess():
    # TODO:
    file_paths = gf.get_paths_from_dir("", "")
    file_paths.sort()
    pts(f"file_paths number: {len(file_paths)}")

    # process the file by multiprocess
    parse_func = run_by_multiprocess_main
    process_num = len(file_paths)
    gw.run_tasks_by_multiprocess(
        file_paths,
        parse_func=parse_func,
        process_num=process_num,
    )

    pass


def main():
    run_by_multiprocess()
    pass


if __name__ == "__main__":
    # ### 发送完成WX通知 ###
    go.sendBotMsg("59ea9346-5fb3-4bee-8748-e64a268ef5a9", func_main=main)
    # ### 发送完成WX通知 ###
    pass
