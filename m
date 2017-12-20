From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/5] Some corrections and improvement for Tegra DRM
Date: Wed, 20 Dec 2017 18:46:09 +0300
Message-ID: <cover.1513783738.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I've aggregated all Tegra DRM patches that I've sent before into a single
series.

What's changed:

	- Alpha formats been dropped in addition to restore of opaque formats
	  on T20/30.

	- Reworked the HW cursor patch a tad, since alpha formats have been
	  dropped from the overlay plane.

	- Fixed warning that was reported by kbuild bot for ARM64 build.

Dmitry Osipenko (5):
  drm/tegra: dc: Link DC1 to DC0 on Tegra20
  drm/tegra: Restore opaque and drop alpha formats on Tegra20/30
  drm/tegra: Trade overlay plane for cursor on older Tegra's
  drm/tegra: gem: Correct iommu_map_sg() error checking
  drm/tegra: Correct timeout in tegra_syncpt_wait

 drivers/gpu/drm/tegra/dc.c    | 184 ++++++++++++++++++++++++++++--------------
 drivers/gpu/drm/tegra/dc.h    |   5 +-
 drivers/gpu/drm/tegra/drm.c   |   3 +-
 drivers/gpu/drm/tegra/fb.c    |  13 ---
 drivers/gpu/drm/tegra/gem.c   |  15 ++--
 drivers/gpu/drm/tegra/hub.c   |   3 +-
 drivers/gpu/drm/tegra/plane.c |  22 +++--
 drivers/gpu/drm/tegra/plane.h |   2 +-
 8 files changed, 158 insertions(+), 89 deletions(-)

-- 
2.15.1
