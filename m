From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v1 0/2] *** Add support for Tegra210 ***
Date: Mon, 16 Mar 2015 15:51:13 -0700
Message-ID: <1426546275-6214-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Six t210 specific supporting files are added under src/t210 diretory.
Comparing T210 bct to T132 bct, the main changes include the size increased
to 10240 from 8704. The number of boot device is reduced to 1 from 4. And many
new fileds are added to nvboot_sdram_params.

Jimmy Zhang (2):
  Add support for Tegra210
  Bump to version 1.5

 configure.ac                       |    2 +-
 src/Makefile.am                    |   12 +-
 src/bct_dump.c                     |    1 +
 src/cbootimage.c                   |    8 +-
 src/cbootimage.h                   |    6 +-
 src/data_layout.c                  |    2 +
 src/parse.c                        |    1 +
 src/parse.h                        |  390 ++++++
 src/set.c                          |    6 +
 src/t210/nvbctlib_t210.c           | 2314 ++++++++++++++++++++++++++++++++++++
 src/t210/nvboot_bct_t210.h         |  406 +++++++
 src/t210/nvboot_config.h           |  315 +++++
 src/t210/nvboot_sdram_param_t210.h |  953 +++++++++++++++
 src/t210/parse_t210.c              |  741 ++++++++++++
 src/t210/sdram_param.h             |  660 ++++++++++
 15 files changed, 5809 insertions(+), 8 deletions(-)
 create mode 100644 src/t210/nvbctlib_t210.c
 create mode 100644 src/t210/nvboot_bct_t210.h
 create mode 100644 src/t210/nvboot_config.h
 create mode 100644 src/t210/nvboot_sdram_param_t210.h
 create mode 100644 src/t210/parse_t210.c
 create mode 100644 src/t210/sdram_param.h

-- 
1.8.1.5
