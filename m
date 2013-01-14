From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 0/5] drm/tegra: Miscellaneous enhancements
Date: Mon, 14 Jan 2013 16:55:27 +0100
Message-ID: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This patch series introduces a number of useful features for the Tegra
DRM driver. The first patch allows VBLANK support to be used in drivers
that don't or can't use DRIVER_HAVE_IRQ for interrupt support.

Patch 2 adds support for the additional two planes available on Tegra
hardware, while patch 3 implement .mode_set_base() to allow for some
nice speed up when changing the framebuffer without actually changing
the resolution. Patch 4 adds VBLANK support and finally patch 5 builds
on it to provide the page-flipping IOCTL.

Thierry

Thierry Reding (5):
  drm: Allow vblank support without DRIVER_HAVE_IRQ
  drm/tegra: Add plane support
  drm/tegra: Implement .mode_set_base()
  drm/tegra: Implement VBLANK support
  drm/tegra: Implement page-flipping support

 drivers/gpu/drm/drm_irq.c   |   5 +-
 drivers/gpu/drm/tegra/dc.c  | 475 ++++++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dc.h  |   2 +-
 drivers/gpu/drm/tegra/drm.c |  53 +++++
 drivers/gpu/drm/tegra/drm.h |  37 ++++
 5 files changed, 461 insertions(+), 111 deletions(-)

-- 
1.8.1
