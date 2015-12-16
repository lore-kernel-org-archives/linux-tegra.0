From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.5-rc1
Date: Wed, 16 Dec 2015 18:24:44 +0100
Message-ID: <1450286684-11157-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 663a233eef643b38f36c05535cb5c9a4972edcc1:

  Merge branch 'drm-header-fixes' of https://github.com/GabrielL/linux into drm-next (2015-12-11 13:46:05 +1000)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.5-rc1

for you to fetch changes up to ad906599c1919eda6f365ecec8d50198c9232131:

  drm/tegra: Advertise DRIVER_ATOMIC (2015-12-14 15:47:36 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.5-rc1

This adds support for the version of host1x found on Tegra210 SoCs. It
also makes use of the new atomic suspend/resume functionality to bring
this feature to Tegra.

Other than that it's mostly small fixes and cleanups, with some prep-
work for things that will hopefully get merged for the next release.

----------------------------------------------------------------
Dan Carpenter (1):
      drm/tegra: checking for IS_ERR() instead of NULL

Daniel Vetter (3):
      drm/tegra: Use unlocked gem unreferencing
      drm/tegra: Don't take dev->struct_mutex in mmap offset ioctl
      drm/tegra: Use drm_gem_object_unreference_unlocked()

Julia Lawall (1):
      drm/tegra: dc: Add missing of_node_put()

Thierry Reding (9):
      gpu: host1x: Use platform_register/unregister_drivers()
      gpu: host1x: Remove core driver on unregister
      gpu: host1x: Add Tegra210 support
      drm/tegra: Use new multi-driver module helpers
      drm/tegra: sor: Operate on struct drm_dp_aux *
      drm/tegra: sor: Remove unnecessary conditional
      drm/tegra: Implement subsystem-level suspend/resume
      drm/tegra: Use DRIVER level for IOMMU aperture message
      drm/tegra: Advertise DRIVER_ATOMIC

 drivers/gpu/drm/tegra/dc.c                  |   4 +-
 drivers/gpu/drm/tegra/dpaux.c               |  41 ++---
 drivers/gpu/drm/tegra/drm.c                 |  89 ++++------
 drivers/gpu/drm/tegra/drm.h                 |  27 ++--
 drivers/gpu/drm/tegra/fb.c                  |  24 +++
 drivers/gpu/drm/tegra/gem.c                 |  15 +-
 drivers/gpu/drm/tegra/sor.c                 | 145 ++++++++---------
 drivers/gpu/host1x/Makefile                 |   3 +-
 drivers/gpu/host1x/bus.c                    |   2 +
 drivers/gpu/host1x/dev.c                    |  33 ++--
 drivers/gpu/host1x/hw/host1x05.c            |  42 +++++
 drivers/gpu/host1x/hw/host1x05.h            |  26 +++
 drivers/gpu/host1x/hw/host1x05_hardware.h   | 142 ++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x05_channel.h | 121 ++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x05_sync.h    | 243 ++++++++++++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h  | 181 +++++++++++++++++++++
 16 files changed, 944 insertions(+), 194 deletions(-)
 create mode 100644 drivers/gpu/host1x/hw/host1x05.c
 create mode 100644 drivers/gpu/host1x/hw/host1x05.h
 create mode 100644 drivers/gpu/host1x/hw/host1x05_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x05_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x05_sync.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x05_uclass.h
