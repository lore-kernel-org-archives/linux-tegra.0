From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.10-rc1
Date: Fri,  9 Dec 2016 15:11:29 +0100
Message-ID: <20161209141129.19961-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.10-rc1

for you to fetch changes up to 585ee0f27ef7b8db46807b960388b7e58b60766d:

  drm/tegra: Set sgt pointer in BO pin (2016-11-11 15:37:13 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.10-rc1

This has a couple of fixes for IOMMU support and some fixes for error
handling.

----------------------------------------------------------------
Arto Merilainen (3):
      gpu: host1x: Store device address to all bufs
      gpu: host1x: Add locking to syncpt
      drm/tegra: Support kernel mappings with IOMMU

Christophe JAILLET (1):
      drm/tegra: gem: Remove some dead code

Christophe Jaillet (3):
      drm/tegra: dpaux: Fix error handling
      drm/tegra: Fix error handling
      drm/tegra: sor: No need to free devm_ allocated memory

Mikko Perttunen (1):
      drm/tegra: Set sgt pointer in BO pin

 drivers/gpu/drm/tegra/dpaux.c |  4 ++--
 drivers/gpu/drm/tegra/gem.c   | 41 +++++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/tegra/gr3d.c  |  4 ++--
 drivers/gpu/drm/tegra/sor.c   |  2 --
 drivers/gpu/host1x/dev.h      |  3 ++-
 drivers/gpu/host1x/job.c      |  9 ++++++---
 drivers/gpu/host1x/syncpt.c   | 23 +++++++++++++++++++----
 7 files changed, 64 insertions(+), 22 deletions(-)
