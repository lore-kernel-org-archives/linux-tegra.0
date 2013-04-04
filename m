From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 0/3] drm/tegra: Add 3D support
Date: Thu,  4 Apr 2013 16:09:17 +0200
Message-ID: <1365084560-11069-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This small series of patches adds support for the 3D engine found on
NVIDIA Tegra SoCs. It builds on top of Terje's and Arto's host1x and
gr2d patches. A couple of things still need to be done before this
can be merged, though.

Patch 1 is the central piece of the series. It adds support for using
the gr3d engine via the same DRM IOCTLs that gr2d uses. A very basic
set of programs to test this can be found here[0].

Patch 2 adds support for the XBGR8888 format, which seems to be what
most gr3d programs use. It also adds the RGB565 as a format supported
by planes. This latter part could be moved to a separate patch, but I
didn't think that was necessary.

Patch 3 finally allows buffer objects to be marked as tiled so that
the display controller can scan them out appropriately.

Thierry

[0]: https://github.com/organizations/grate-driver

Thierry Reding (3):
  WIP: drm/tegra: Add 3D support
  drm/tegra: Support the XBGR8888 pixelformat
  drm/tegra: Add support for tiled buffer objects

 drivers/gpu/host1x/Makefile   |   1 +
 drivers/gpu/host1x/dev.c      |   7 +
 drivers/gpu/host1x/dev.h      |   1 +
 drivers/gpu/host1x/drm/dc.c   |  16 +++
 drivers/gpu/host1x/drm/dc.h   |   4 +
 drivers/gpu/host1x/drm/drm.c  |   4 +-
 drivers/gpu/host1x/drm/drm.h  |   2 +
 drivers/gpu/host1x/drm/fb.c   |  12 +-
 drivers/gpu/host1x/drm/gem.c  |  20 ++-
 drivers/gpu/host1x/drm/gem.h  |  13 +-
 drivers/gpu/host1x/drm/gr3d.c | 289 ++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/host1x.h   |   3 +-
 include/uapi/drm/tegra_drm.h  |   2 +
 13 files changed, 360 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/host1x/drm/gr3d.c

-- 
1.8.2
