From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 0/5] media: tegra: Tegra video driver follow-up patches
Date: Mon, 27 Apr 2020 21:20:45 -0700
Message-ID: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl
Cc: digetx@gmail.com, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This is a fllow-up to some last feedback received for Tegra VI driver RFC
v10 patches.
https://patchwork.linuxtv.org/cover/63334/


Sowjanya Komatineni (5):
  MAINTAINERS: Rename Tegra Video driver path
  media: tegra: Rename driver path to tegra-video
  media: tegra-video: Move PM runtime handle to streaming
  media: tegra-video: Rearrange SoC specific to Tegra210 and cleanup
    files
  media: tegra-video: Remove module macros for vi and csi driver

 MAINTAINERS                                  |    2 +-
 drivers/staging/media/Kconfig                |    2 +-
 drivers/staging/media/Makefile               |    2 +-
 drivers/staging/media/tegra-video/Kconfig    |   12 +
 drivers/staging/media/tegra-video/Makefile   |    8 +
 drivers/staging/media/tegra-video/TODO       |   10 +
 drivers/staging/media/tegra-video/csi.c      |  536 ++++++++++++
 drivers/staging/media/tegra-video/csi.h      |  146 ++++
 drivers/staging/media/tegra-video/tegra210.c | 1080 ++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c       | 1082 +++++++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h       |  258 ++++++
 drivers/staging/media/tegra-video/video.c    |  155 ++++
 drivers/staging/media/tegra-video/video.h    |   29 +
 drivers/staging/media/tegra/Kconfig          |   12 -
 drivers/staging/media/tegra/Makefile         |    8 -
 drivers/staging/media/tegra/TODO             |   10 -
 drivers/staging/media/tegra/common.h         |  259 ------
 drivers/staging/media/tegra/csi.c            |  604 --------------
 drivers/staging/media/tegra/csi.h            |  144 ----
 drivers/staging/media/tegra/tegra210.c       |  708 ----------------
 drivers/staging/media/tegra/tegra210.h       |  190 -----
 drivers/staging/media/tegra/vi.c             | 1127 --------------------------
 drivers/staging/media/tegra/vi.h             |   72 --
 drivers/staging/media/tegra/video.c          |  153 ----
 drivers/staging/media/tegra/video.h          |   29 -
 25 files changed, 3319 insertions(+), 3319 deletions(-)
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h
 delete mode 100644 drivers/staging/media/tegra/Kconfig
 delete mode 100644 drivers/staging/media/tegra/Makefile
 delete mode 100644 drivers/staging/media/tegra/TODO
 delete mode 100644 drivers/staging/media/tegra/common.h
 delete mode 100644 drivers/staging/media/tegra/csi.c
 delete mode 100644 drivers/staging/media/tegra/csi.h
 delete mode 100644 drivers/staging/media/tegra/tegra210.c
 delete mode 100644 drivers/staging/media/tegra/tegra210.h
 delete mode 100644 drivers/staging/media/tegra/vi.c
 delete mode 100644 drivers/staging/media/tegra/vi.h
 delete mode 100644 drivers/staging/media/tegra/video.c
 delete mode 100644 drivers/staging/media/tegra/video.h

-- 
2.7.4
