From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] drm/tegra: Fix CRTC association with outputs
Date: Tue, 14 Jan 2014 15:45:56 +0100
Message-ID: <1389710758-29444-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The Tegra DRM driver assumes that CRTCs are probed in the order listed
in the DT. While DT makes no such guarantees in the first place, this
used to work fine. With the introduction of the panel support, however,
more often than not one of the CRTCs will defer probing (caused by the
panel not having been registered yet) and the assumptions are broken.

To fix this, we use the new drm_crtc_mask() function to obtain the mask
of the display controller that an RGB output can be associated with,
thereby making it resistant to changes in probe order.

A second patch is required to obtain the number of the head from the
device tree, since we can no longer rely on the probe order providing us
with the right one.

Thierry

Thierry Reding (2):
  drm/tegra: Fix possible CRTC mask for RGB outputs
  drm/tegra: Obtain head number from DT

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  3 ++
 drivers/gpu/drm/tegra/dc.c                         | 41 ++++++++++++++++++++--
 drivers/gpu/drm/tegra/rgb.c                        |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)

-- 
1.8.4.2
