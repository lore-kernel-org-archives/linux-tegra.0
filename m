From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.15-rc1
Date: Fri, 20 Oct 2017 14:26:20 +0200
Message-ID: <20171020122620.11804-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 9e66317d3c92ddaab330c125dfe9d06eee268aff:

  Linux 4.14-rc3 (2017-10-01 14:54:54 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.15-rc1

for you to fetch changes up to fb83be8873909ba7c089d1c5cb72873cc2cce7d1:

  drm/tegra: hdmi: Add cec-notifier support (2017-10-20 14:19:54 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.15-rc1

This contains a bit of cleanup and some minor fixes for the host1x and
Tegra DRM drivers. There's also some more preparatory work for Tegra186
support which I'm not quite ready to send upstream because the GPIO
driver needed for HDMI support has been stuck for months, and we can't
do much without it. Hopefully that driver will land in v4.15, which
would mean we could go ahead with Tegra186 display support in v4.16.

----------------------------------------------------------------
Hans Verkuil (1):
      drm/tegra: hdmi: Add cec-notifier support

Mikko Perttunen (10):
      dt-bindings: host1x: Add Tegra186 information
      gpu: host1x: Add Tegra186 support
      drm/tegra: Add Tegra186 support for VIC
      gpu: host1x: Call of_dma_configure() after setting bus
      gpu: host1x: Enable Tegra186 syncpoint protection
      gpu: host1x: Enable gather filter
      gpu: host1x: Improve debug disassembly formatting
      gpu: host1x: Disassemble more instructions
      gpu: host1x: Fix incorrect comment for channel_request
      drm/tegra: Use u64_to_user_ptr helper

Thierry Reding (10):
      gpu: host1x: Use of_device_get_match_data()
      gpu: host1x: syncpt: Request syncpoints per client
      drm/tegra: dc: Use of_device_get_match_data()
      drm/tegra: hdmi: Use of_device_get_match_data()
      drm/tegra: sor: Use of_device_get_match_data()
      drm/tegra: vic: Use of_device_get_match_data()
      drm/tegra: dc: Move some declarations to dc.h
      drm/tegra: dc: Simplify atomic plane helper functions
      drm/tegra: dc: Make sure to set the module clock rate
      drm/tegra: dc: Perform a complete reset sequence

 .../display/tegra/nvidia,tegra20-host1x.txt        |   4 +
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tegra/dc.c                         |  84 ++++----
 drivers/gpu/drm/tegra/dc.h                         | 120 +++++++++++
 drivers/gpu/drm/tegra/drm.c                        |  30 +--
 drivers/gpu/drm/tegra/drm.h                        | 106 +--------
 drivers/gpu/drm/tegra/gr2d.c                       |   2 +-
 drivers/gpu/drm/tegra/gr3d.c                       |   2 +-
 drivers/gpu/drm/tegra/hdmi.c                       |  17 +-
 drivers/gpu/drm/tegra/output.c                     |   6 +
 drivers/gpu/drm/tegra/sor.c                        |   5 +-
 drivers/gpu/drm/tegra/vic.c                        |  22 +-
 drivers/gpu/host1x/Makefile                        |   3 +-
 drivers/gpu/host1x/bus.c                           |   3 +-
 drivers/gpu/host1x/channel.c                       |   3 +-
 drivers/gpu/host1x/debug.c                         |  14 +-
 drivers/gpu/host1x/debug.h                         |  14 +-
 drivers/gpu/host1x/dev.c                           |  69 ++++--
 drivers/gpu/host1x/dev.h                           |  19 ++
 drivers/gpu/host1x/hw/cdma_hw.c                    |  49 +++--
 drivers/gpu/host1x/hw/channel_hw.c                 |  24 +++
 drivers/gpu/host1x/hw/debug_hw.c                   | 240 ++++++++-------------
 drivers/gpu/host1x/hw/debug_hw_1x01.c              | 154 +++++++++++++
 drivers/gpu/host1x/hw/debug_hw_1x06.c              | 135 ++++++++++++
 drivers/gpu/host1x/hw/host1x01.c                   |   2 +
 drivers/gpu/host1x/hw/host1x02.c                   |   2 +
 drivers/gpu/host1x/hw/host1x04.c                   |   2 +
 drivers/gpu/host1x/hw/host1x05.c                   |   2 +
 drivers/gpu/host1x/hw/host1x06.c                   |  44 ++++
 drivers/gpu/host1x/hw/host1x06.h                   |  26 +++
 drivers/gpu/host1x/hw/host1x06_hardware.h          | 142 ++++++++++++
 drivers/gpu/host1x/hw/hw_host1x04_channel.h        |  12 ++
 drivers/gpu/host1x/hw/hw_host1x05_channel.h        |  12 ++
 drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h     |  32 +++
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h         | 181 ++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x06_vm.h             |  47 ++++
 drivers/gpu/host1x/hw/intr_hw.c                    |  29 ++-
 drivers/gpu/host1x/hw/syncpt_hw.c                  |  46 ++++
 drivers/gpu/host1x/syncpt.c                        |  24 ++-
 drivers/gpu/host1x/syncpt.h                        |   2 +-
 include/linux/host1x.h                             |   2 +-
 41 files changed, 1334 insertions(+), 399 deletions(-)
 create mode 100644 drivers/gpu/host1x/hw/debug_hw_1x01.c
 create mode 100644 drivers/gpu/host1x/hw/debug_hw_1x06.c
 create mode 100644 drivers/gpu/host1x/hw/host1x06.c
 create mode 100644 drivers/gpu/host1x/hw/host1x06.h
 create mode 100644 drivers/gpu/host1x/hw/host1x06_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x06_vm.h
