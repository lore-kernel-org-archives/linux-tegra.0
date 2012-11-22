From: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/6] Support for Tegra 2D hardware
Date: Thu, 22 Nov 2012 14:16:48 +0200
Message-ID: <1353586614-7308-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This set of patches adds support for Tegra20 and Tegra30 host1x and
2D. It is based on Thierry Reding's tegra/next branch.

nvhost is the driver that controls host1x hardware. It supports
host1x command channels, synchronization, run-time power management
and memory management.

The patch set removes responsibility of host1x from tegradrm. At the
same time, it moves all drm related infrastructure in host1x.c to
other files.

The patch set also adds user space API to tegradrm for accessing
features provided by nvhost to tegradrm. We have prepared also
patches to libdrm, but they are not yet ready for sending out.

Please note that IOMMU support has effectively been disabled in this
patch. The problem with IOMMU is that we should put all host1x
devices under the same address space, but we haven't found a nice way
of doing that in case of multiple drivers.

Arto Merilainen (3):
  gpu: drm: tegra: Remove redundant host1x
  gpu: drm: tegra: Free platform data on remove
  gpu: drm: tegra: Prime support

Terje Bergstrom (3):
  video: tegra: Add nvhost driver
  ARM: tegra: Add auxiliary data for nvhost
  drm: tegra: Add gr2d device

 arch/arm/mach-tegra/board-dt-tegra20.c             |   38 +-
 arch/arm/mach-tegra/board-dt-tegra30.c             |   38 +-
 arch/arm/mach-tegra/tegra20_clocks_data.c          |    8 +-
 arch/arm/mach-tegra/tegra30_clocks_data.c          |    2 +
 drivers/gpu/drm/tegra/Kconfig                      |    8 +-
 drivers/gpu/drm/tegra/Makefile                     |    4 +-
 drivers/gpu/drm/tegra/dc.c                         |   25 +-
 drivers/gpu/drm/tegra/dmabuf.c                     |  150 ++++++
 drivers/gpu/drm/tegra/drm.c                        |  444 ++++++++++++++--
 drivers/gpu/drm/tegra/drm.h                        |   89 ++--
 drivers/gpu/drm/tegra/dsi.c                        |   27 +-
 drivers/gpu/drm/tegra/fb.c                         |   26 +-
 drivers/gpu/drm/tegra/gr2d.c                       |  225 +++++++++
 drivers/gpu/drm/tegra/hdmi.c                       |   27 +-
 drivers/gpu/drm/tegra/host1x.c                     |  343 -------------
 drivers/gpu/drm/tegra/tvo.c                        |   36 +-
 drivers/video/Kconfig                              |    2 +
 drivers/video/Makefile                             |    2 +
 drivers/video/tegra/host/Kconfig                   |   20 +
 drivers/video/tegra/host/Makefile                  |   21 +
 drivers/video/tegra/host/bus_client.c              |  101 ++++
 drivers/video/tegra/host/bus_client.h              |   32 ++
 drivers/video/tegra/host/chip_support.c            |   68 +++
 drivers/video/tegra/host/chip_support.h            |  179 +++++++
 drivers/video/tegra/host/debug.c                   |  255 ++++++++++
 drivers/video/tegra/host/debug.h                   |   50 ++
 drivers/video/tegra/host/dev.c                     |  104 ++++
 drivers/video/tegra/host/dev.h                     |   33 ++
 drivers/video/tegra/host/dmabuf.c                  |  151 ++++++
 drivers/video/tegra/host/dmabuf.h                  |   51 ++
 drivers/video/tegra/host/host1x/Makefile           |    6 +
 drivers/video/tegra/host/host1x/host1x.c           |  320 ++++++++++++
 drivers/video/tegra/host/host1x/host1x.h           |   97 ++++
 .../video/tegra/host/host1x/host1x01_hardware.h    |  157 ++++++
 drivers/video/tegra/host/host1x/host1x_cdma.c      |  488 ++++++++++++++++++
 drivers/video/tegra/host/host1x/host1x_cdma.h      |   39 ++
 drivers/video/tegra/host/host1x/host1x_channel.c   |  157 ++++++
 drivers/video/tegra/host/host1x/host1x_debug.c     |  405 +++++++++++++++
 drivers/video/tegra/host/host1x/host1x_intr.c      |  263 ++++++++++
 drivers/video/tegra/host/host1x/host1x_syncpt.c    |  170 +++++++
 .../video/tegra/host/host1x/hw_host1x01_channel.h  |  182 +++++++
 drivers/video/tegra/host/host1x/hw_host1x01_sync.h |  398 +++++++++++++++
 .../video/tegra/host/host1x/hw_host1x01_uclass.h   |  474 +++++++++++++++++
 drivers/video/tegra/host/nvhost_acm.c              |  532 ++++++++++++++++++++
 drivers/video/tegra/host/nvhost_acm.h              |   49 ++
 drivers/video/tegra/host/nvhost_cdma.c             |  473 +++++++++++++++++
 drivers/video/tegra/host/nvhost_cdma.h             |  116 +++++
 drivers/video/tegra/host/nvhost_channel.c          |  129 +++++
 drivers/video/tegra/host/nvhost_channel.h          |   65 +++
 drivers/video/tegra/host/nvhost_intr.c             |  391 ++++++++++++++
 drivers/video/tegra/host/nvhost_intr.h             |  110 ++++
 drivers/video/tegra/host/nvhost_job.c              |  398 +++++++++++++++
 drivers/video/tegra/host/nvhost_memmgr.c           |  252 ++++++++++
 drivers/video/tegra/host/nvhost_memmgr.h           |   66 +++
 drivers/video/tegra/host/nvhost_syncpt.c           |  453 +++++++++++++++++
 drivers/video/tegra/host/nvhost_syncpt.h           |  148 ++++++
 drivers/video/tegra/host/t20/Makefile              |    6 +
 drivers/video/tegra/host/t20/t20.c                 |   78 +++
 drivers/video/tegra/host/t20/t20.h                 |   29 ++
 drivers/video/tegra/host/t30/Makefile              |    6 +
 drivers/video/tegra/host/t30/t30.c                 |   80 +++
 drivers/video/tegra/host/t30/t30.h                 |   29 ++
 include/drm/tegra_drm.h                            |  129 +++++
 include/linux/nvhost.h                             |  302 +++++++++++
 include/trace/events/nvhost.h                      |  249 +++++++++
 65 files changed, 9295 insertions(+), 510 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/dmabuf.c
 create mode 100644 drivers/gpu/drm/tegra/gr2d.c
 delete mode 100644 drivers/gpu/drm/tegra/host1x.c
 create mode 100644 drivers/video/tegra/host/Kconfig
 create mode 100644 drivers/video/tegra/host/Makefile
 create mode 100644 drivers/video/tegra/host/bus_client.c
 create mode 100644 drivers/video/tegra/host/bus_client.h
 create mode 100644 drivers/video/tegra/host/chip_support.c
 create mode 100644 drivers/video/tegra/host/chip_support.h
 create mode 100644 drivers/video/tegra/host/debug.c
 create mode 100644 drivers/video/tegra/host/debug.h
 create mode 100644 drivers/video/tegra/host/dev.c
 create mode 100644 drivers/video/tegra/host/dev.h
 create mode 100644 drivers/video/tegra/host/dmabuf.c
 create mode 100644 drivers/video/tegra/host/dmabuf.h
 create mode 100644 drivers/video/tegra/host/host1x/Makefile
 create mode 100644 drivers/video/tegra/host/host1x/host1x.c
 create mode 100644 drivers/video/tegra/host/host1x/host1x.h
 create mode 100644 drivers/video/tegra/host/host1x/host1x01_hardware.h
 create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.c
 create mode 100644 drivers/video/tegra/host/host1x/host1x_cdma.h
 create mode 100644 drivers/video/tegra/host/host1x/host1x_channel.c
 create mode 100644 drivers/video/tegra/host/host1x/host1x_debug.c
 create mode 100644 drivers/video/tegra/host/host1x/host1x_intr.c
 create mode 100644 drivers/video/tegra/host/host1x/host1x_syncpt.c
 create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_channel.h
 create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_sync.h
 create mode 100644 drivers/video/tegra/host/host1x/hw_host1x01_uclass.h
 create mode 100644 drivers/video/tegra/host/nvhost_acm.c
 create mode 100644 drivers/video/tegra/host/nvhost_acm.h
 create mode 100644 drivers/video/tegra/host/nvhost_cdma.c
 create mode 100644 drivers/video/tegra/host/nvhost_cdma.h
 create mode 100644 drivers/video/tegra/host/nvhost_channel.c
 create mode 100644 drivers/video/tegra/host/nvhost_channel.h
 create mode 100644 drivers/video/tegra/host/nvhost_intr.c
 create mode 100644 drivers/video/tegra/host/nvhost_intr.h
 create mode 100644 drivers/video/tegra/host/nvhost_job.c
 create mode 100644 drivers/video/tegra/host/nvhost_memmgr.c
 create mode 100644 drivers/video/tegra/host/nvhost_memmgr.h
 create mode 100644 drivers/video/tegra/host/nvhost_syncpt.c
 create mode 100644 drivers/video/tegra/host/nvhost_syncpt.h
 create mode 100644 drivers/video/tegra/host/t20/Makefile
 create mode 100644 drivers/video/tegra/host/t20/t20.c
 create mode 100644 drivers/video/tegra/host/t20/t20.h
 create mode 100644 drivers/video/tegra/host/t30/Makefile
 create mode 100644 drivers/video/tegra/host/t30/t30.c
 create mode 100644 drivers/video/tegra/host/t30/t30.h
 create mode 100644 include/drm/tegra_drm.h
 create mode 100644 include/linux/nvhost.h
 create mode 100644 include/trace/events/nvhost.h

-- 
1.7.9.5
