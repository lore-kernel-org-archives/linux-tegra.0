From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.12-rc1
Date: Fri,  7 Apr 2017 00:47:58 +0200
Message-ID: <20170406224758.29946-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 97da3854c526d3a6ee05c849c96e48d21527606c:

  Linux 4.11-rc3 (2017-03-19 19:09:39 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.12-rc1

for you to fetch changes up to b0d36daa0ab54714e05164f6e21d22f974a5eec1:

  gpu: host1x: Fix host1x driver shutdown (2017-04-05 18:11:50 +0200)

Note that this pulls in a branch from Joerg's IOMMU tree that is required
to resolve some build time dependencies. I've included it in the diffstat
below.

Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.12-rc1

This contains various fixes to the host1x driver as well as a plug for a
leak of kernel pointers to userspace.

A fairly big addition this time around is the Video Image Composer (VIC)
support that can be used to accelerate some 2D and image compositing
operations.

Furthermore the driver now supports FB modifiers, so we no longer rely
on a custom IOCTL to set those.

Finally this contains a few preparatory patches for Tegra186 support
which unfortunately didn't quite make it this time, but will hopefully
be ready for v4.13.

----------------------------------------------------------------
Alexandre Courbot (1):
      drm/tegra: Add tiling FB modifiers

Arto Merilainen (2):
      drm/tegra: Add falcon helper library
      drm/tegra: Add VIC support

Joerg Roedel (1):
      iommu/iova: Fix compile error with CONFIG_IOMMU_IOVA=m

Marek Szyprowski (1):
      iommu/iova: Consolidate code for adding new node to iovad domain rbtree

Mikko Perttunen (3):
      gpu: host1x: Add IOMMU support
      drm/tegra: Add Tegra DRM allocation API
      dt-bindings: Add bindings for the Tegra VIC

Thierry Reding (10):
      MAINTAINERS: Add related headers to IOMMU section
      iommu: Add dummy implementations for !IOMMU_IOVA
      Merge branch 'core' of git://git.kernel.org/.../joro/iommu into drm/tegra/for-next
      gpu: host1x: Fix potential out-of-bounds access
      drm/tegra: Enable IOVA API when IOMMU support is enabled
      drm/tegra: Protect IOMMU operations by mutex
      drm/tegra: Don't leak kernel pointer to userspace
      gpu: host1x: Sort includes alphabetically
      gpu: host1x: Support module reset
      gpu: host1x: Fix host1x driver shutdown

 .../display/tegra/nvidia,tegra20-host1x.txt        |  13 +
 MAINTAINERS                                        |   2 +
 drivers/gpu/drm/tegra/Kconfig                      |   1 +
 drivers/gpu/drm/tegra/Makefile                     |   4 +-
 drivers/gpu/drm/tegra/drm.c                        | 283 ++++++++++++---
 drivers/gpu/drm/tegra/drm.h                        |  15 +-
 drivers/gpu/drm/tegra/falcon.c                     | 259 ++++++++++++++
 drivers/gpu/drm/tegra/falcon.h                     | 127 +++++++
 drivers/gpu/drm/tegra/fb.c                         |  23 +-
 drivers/gpu/drm/tegra/gem.c                        |  12 +-
 drivers/gpu/drm/tegra/vic.c                        | 396 +++++++++++++++++++++
 drivers/gpu/drm/tegra/vic.h                        |  31 ++
 drivers/gpu/host1x/bus.c                           |  68 ++--
 drivers/gpu/host1x/cdma.c                          |  74 +++-
 drivers/gpu/host1x/cdma.h                          |   6 +-
 drivers/gpu/host1x/dev.c                           |  76 +++-
 drivers/gpu/host1x/dev.h                           |  14 +-
 drivers/gpu/host1x/hw/cdma_hw.c                    |  16 +-
 drivers/gpu/host1x/job.c                           |  72 +++-
 drivers/gpu/host1x/job.h                           |   1 +
 drivers/gpu/host1x/syncpt.c                        |   2 +-
 drivers/iommu/iova.c                               |  87 ++---
 include/linux/host1x.h                             |   1 +
 include/linux/iova.h                               |  91 +++++
 include/uapi/drm/drm_fourcc.h                      |  45 +++
 25 files changed, 1517 insertions(+), 202 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/falcon.c
 create mode 100644 drivers/gpu/drm/tegra/falcon.h
 create mode 100644 drivers/gpu/drm/tegra/vic.c
 create mode 100644 drivers/gpu/drm/tegra/vic.h
