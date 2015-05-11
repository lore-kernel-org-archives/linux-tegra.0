From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 00/12] Tegra: Add DC one-shot support
Date: Mon, 11 May 2015 09:38:19 +0800
Message-ID: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch set adds the Tegra dc one-shot support. The patch set is
tested on Dalmore + Sharp lq101r1sx01.

Basically this patch set is just for RFC. Some DRM files are changes,
I guess maybe there are better solutions for that. Also, Thierry
mentioned that "te-polarity" can be designed as a GPIO since not
every display controller has a dedicate TE pin like Tegra. So I
will try to create v2 after some comments are received.

Please be noticed that the patch #12 is not part of the feature,
it's just used for testing.

Mark Zhang (12):
  drm: Add a new mode flag: DRM_MODE_FLAG_PREFER_ONE_SHOT
  drm: panel: Add one-shot flag to Sharp lq101r1sx01 driver
  drm: panel: Turn on TE(Tearing Effect) on Sharp lq101r1sx01
  drm: Add DRM mode flag TE polarity
  dt: panel: Add property "te-polarity"
  drm: panel: Parse "te-polarity" in Sharp lq101r1sx01 driver
  drm/tegra: Set NC(Non-contiguous) mode to dc for one-shot
  drm/panel: Add panel func: idle/busy
  drm: dsi: Add "enter idle" & "exit idle" dcs functions
  drm: panel: Add idle/busy in Sharp lq101r1sx01 driver
  drm/tegra: Suspend dc/dsi/panel in one-shot mode
  JUST FOR TEST: Add one-shot trigger to update display

 .../bindings/panel/sharp,lq101r1sx01.txt           |   2 +
 arch/arm/boot/dts/tegra114-dalmore.dts             |   2 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  36 ++++++
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |  51 ++++++++-
 drivers/gpu/drm/tegra/dc.c                         | 124 ++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.h                         |   5 +
 drivers/gpu/drm/tegra/drm.h                        |   4 +
 drivers/gpu/drm/tegra/dsi.c                        |  63 ++++++++++-
 include/drm/drm_mipi_dsi.h                         |   2 +
 include/drm/drm_panel.h                            |  18 +++
 include/uapi/drm/drm_mode.h                        |   3 +
 11 files changed, 290 insertions(+), 20 deletions(-)

-- 
2.1.4
