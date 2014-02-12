From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] drm/tegra: Restore licensing consistency
Date: Wed, 12 Feb 2014 08:30:35 +0100
Message-ID: <1392190238-1717-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The bulk of the Tegra DRM driver is GPL v2 licensed, but some of the new
subdrivers were licensed under an MIT license. This was simply oversight
on my part.

One exception to this is the public header file that will eventually be
used within libdrm. Since all the other headers in libdrm use the MIT
license, do the same for Tegra.

Thierry

Thierry Reding (3):
  drm/tegra: Relicense public header under MIT
  drm/tegra: Relicense under GPL v2
  drm/tegra: Use standard GPL v2 license text

 drivers/gpu/drm/tegra/dsi.c      | 20 +++-----------------
 drivers/gpu/drm/tegra/dsi.h      | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c      | 11 +++--------
 drivers/gpu/drm/tegra/gem.h      | 14 +++-----------
 drivers/gpu/drm/tegra/gr2d.c     | 14 +++-----------
 drivers/gpu/drm/tegra/mipi-phy.c | 20 +++-----------------
 drivers/gpu/drm/tegra/mipi-phy.h | 20 +++-----------------
 include/uapi/drm/tegra_drm.h     | 26 +++++++++++++++++---------
 8 files changed, 38 insertions(+), 107 deletions(-)

-- 
1.8.4.2
