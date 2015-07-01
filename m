From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 00/12] Tegra: Add DC one-shot support
Date: Wed, 1 Jul 2015 16:21:43 +0800
Message-ID: <1435738915-31973-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch set adds the Tegra dc one-shot support. The patch set is
tested on Dalmore + Sharp lq101r1sx01.

Please be noticed that the patch #12 is not part of the feature,
it's just used for testing.

Changes in v2:
- Define one-shot flag in drm_display_mode->private_flags, according
  to Daniel's comments
- Remove the "te-polarity" property in dts. The TE polarity is determined
  by panel so there is not necessary to define it in DTS. We can define
  it in panel driver.
- Rebased the patch series on top of 6/29 linux-next.
- Fix a bug in DSI suspend DPMS event, to wait DSI idle before suspend
- Fix a bug in DSI driver to correct the DPMS state(patch #11)

Mark Zhang (12):
  drm: panel: Add a new private mode flag:
    DRM_PANEL_FLAG_PREFER_ONE_SHOT
  drm: panel: Add one-shot flag to Sharp lq101r1sx01 driver
  drm: panel: Turn on TE(Tearing Effect) on Sharp lq101r1sx01
  drm: panel: Add DRM panel private mode flag: TE polarity
  drm: panel: Set TE polarity flag in Sharp lq101r1sx01 driver
  drm/tegra: Set NC(Non-contiguous) mode to dc for one-shot
  drm/panel: Add panel func: idle/busy
  drm: dsi: Add "enter idle" & "exit idle" dcs functions
  drm: panel: Add idle/busy in Sharp lq101r1sx01 driver
  drm/tegra: Suspend dc/dsi/panel in one-shot mode
  drm/tegra: dsi: Set connector DPMS state when enable/disable
  JUST FOR TEST: Add one-shot trigger to update display

 drivers/gpu/drm/drm_mipi_dsi.c                  |   36 +++++++
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c |   35 +++++++
 drivers/gpu/drm/tegra/dc.c                      |  128 +++++++++++++++++++++--
 drivers/gpu/drm/tegra/dc.h                      |    5 +
 drivers/gpu/drm/tegra/drm.h                     |    4 +
 drivers/gpu/drm/tegra/dsi.c                     |   79 +++++++++++++-
 include/drm/drm_mipi_dsi.h                      |    2 +
 include/drm/drm_panel.h                         |   22 ++++
 8 files changed, 300 insertions(+), 11 deletions(-)

-- 
1.7.9.5
