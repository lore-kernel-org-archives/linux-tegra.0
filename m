From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 0/9] drm/tegra: Miscellaneous enhancements
Date: Thu, 21 Feb 2013 15:35:52 +0100
Message-ID: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch series introduces a number of useful features for the Tegra
DRM driver. Patch 1 is a documentation update and adds a warning to the
page-flip IOCTL to catch buggy drivers that return success but failed to
update the crtc->fb field, which would cause the reference counting to
become unbalanced.

Patch 2 removes usage of the tegra_framebuffer structure which was used
before the driver moved to the CMA FB helpers. It is wrong to use it but
it happens to work because the drm_fb_cma and tegra_framebuffers were
sufficiently similar.

Patch 3 adds support for the additional two planes available on Tegra
hardware, while patch 4 implement .mode_set_base() to allow for some
nice speed up when changing the framebuffer without actually changing
the resolution. Patch 5 adds VBLANK support and patch 6 builds on the
previous two to provide the page-flipping IOCTL. Patch 7 splits the
DC_CMD_STATE_CONTROL register writes into two consecutive writes as
required by the TRM.

Finally patch 8 fixes color expansions for pixel formats with less than
24 bits per pixel and patch 9 adds a new file, named "framebuffers" to
debugfs which can be used to dump a list of framebuffers attached to the
DRM device. This is most useful to inspect the reference count but could
also be helpful in diagnosing out-of-memory conditions and such.

This series is based on Dave's drm-next branch.

Thierry

Thierry Reding (9):
  drm: Add consistency check for page-flipping
  drm/tegra: Remove bogus tegra_framebuffer structure
  drm/tegra: Add plane support
  drm/tegra: Implement .mode_set_base()
  drm/tegra: Implement VBLANK support
  drm/tegra: Implement page-flipping support
  drm/tegra: Split DC_CMD_STATE_CONTROL register write
  drm/tegra: Fix color expansion
  drm/tegra: Add list of framebuffers to debugfs

 Documentation/DocBook/drm.tmpl |   6 +
 drivers/gpu/drm/drm_crtc.c     |   7 +
 drivers/gpu/drm/tegra/dc.c     | 585 +++++++++++++++++++++++++++++++++--------
 drivers/gpu/drm/tegra/dc.h     |  14 +-
 drivers/gpu/drm/tegra/drm.c    | 103 ++++++++
 drivers/gpu/drm/tegra/drm.h    |  43 ++-
 6 files changed, 635 insertions(+), 123 deletions(-)

-- 
1.8.1.2
