From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/12] drm/tegra: Basic Tegra186 support
Date: Mon, 27 Nov 2017 11:09:40 +0100
Message-ID: <20171127100952.22465-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

this series adds support for display and HDMI on Tegra186. The initial 6
patches are preparatory work to move code around and make the subsequent
patches easier to review.

Patch 7 introduces the display hub driver which controls resources
shared between all display controllers and patch 8 extends the display
controller driver with Tegra186 support. Some changes to the registers
are backwards incompatible, but this can be dealt with with a bit of
parameterization of code and register offsets.

Finally, the SOR driver is also parameterized to take into account some
changes on Tegra186 and the last patch in the series enables support for
HDMI 2.0 modes using the SCDC helpers.

Thierry

Thierry Reding (12):
  drm/tegra: dc: Remove tegra_primary_plane_destroy()
  drm/tegra: dc: Remove duplicate plane funcs
  drm/tegra: dc: Remove tegra_overlay_plane_destroy()
  drm/tegra: dc: Remove duplicate plane funcs
  drm/tegra: dc: Move state definition to header
  drm/tegra: Move common plane code to separate file
  drm/tegra: Add Tegra186 display hub support
  drm/tegra: dc: Add Tegra186 support
  drm/tegra: Support ARGB and ABGR formats
  drm/tegra: sor: Parameterize register offsets
  drm/tegra: sor: Add Tegra186 support
  drm/tegra: sor: Support HDMI 2.0 modes

 drivers/gpu/drm/tegra/Makefile |   2 +
 drivers/gpu/drm/tegra/dc.c     | 549 +++++++++++++---------------
 drivers/gpu/drm/tegra/dc.h     | 237 ++++++++++--
 drivers/gpu/drm/tegra/drm.c    |  70 +++-
 drivers/gpu/drm/tegra/drm.h    |  21 ++
 drivers/gpu/drm/tegra/hub.c    | 808 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/hub.h    |  82 +++++
 drivers/gpu/drm/tegra/output.c |  24 ++
 drivers/gpu/drm/tegra/plane.c  | 188 ++++++++++
 drivers/gpu/drm/tegra/plane.h  |  61 ++++
 drivers/gpu/drm/tegra/sor.c    | 805 +++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/tegra/sor.h    |  16 +
 12 files changed, 2329 insertions(+), 534 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/hub.c
 create mode 100644 drivers/gpu/drm/tegra/hub.h
 create mode 100644 drivers/gpu/drm/tegra/plane.c
 create mode 100644 drivers/gpu/drm/tegra/plane.h

-- 
2.15.0
