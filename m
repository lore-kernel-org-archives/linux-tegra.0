From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Fri, 20 Mar 2015 17:20:18 -0700
Message-ID: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Four t210 specific supporting files are added under src/t210 diretory.
Comparing T210 bct to T132 bct, the main changes include the size increased
to 10240 from 8704. The number of boot devices that can be specified in bct
is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_params.

v1: Initial changes
v2: Fix some minor issues found in v1
    Removed files src/t210/nvboot_config.h and src/t210/sdram_param.h
            that were added unintentionally in v1.
v3: Remove "deprecated" from help -t option help text.
 
Jimmy Zhang (3):
  Add support for Tegra210
  Remove misleading message "deprecated"
  Bump to version 1.5

 configure.ac                       |    2 +-
 src/Makefile.am                    |   12 +-
 src/bct_dump.c                     |    1 +
 src/cbootimage.c                   |   10 +-
 src/cbootimage.h                   |    6 +-
 src/data_layout.c                  |    2 +
 src/parse.c                        |    1 +
 src/parse.h                        |  390 ++++++
 src/set.c                          |    6 +
 src/t210/nvbctlib_t210.c           | 2314 ++++++++++++++++++++++++++++++++++++
 src/t210/nvboot_bct_t210.h         |  406 +++++++
 src/t210/nvboot_sdram_param_t210.h |  953 +++++++++++++++
 src/t210/parse_t210.c              |  741 ++++++++++++
 13 files changed, 4835 insertions(+), 9 deletions(-)
 create mode 100644 src/t210/nvbctlib_t210.c
 create mode 100644 src/t210/nvboot_bct_t210.h
 create mode 100644 src/t210/nvboot_sdram_param_t210.h
 create mode 100644 src/t210/parse_t210.c

-- 
1.8.1.5
