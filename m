From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v3.20-rc1
Date: Thu, 19 Feb 2015 14:33:18 +0100
Message-ID: <1424352798-6809-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 45ee2dbc65cbf6910892c480e6f428be342fa733:

  Merge branch 'drm-next-3.20' of git://people.freedesktop.org/~agd5f/linux into drm-next (2015-02-16 13:55:49 +1000)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-3.20-rc1-fixes

for you to fetch changes up to 07d05cbf60ed8f06c61484d3d85c06c1aa7edf38:

  drm/tegra: dc: Move more code into ->init() (2015-02-19 14:21:51 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v3.20-rc1

This fixes a bit of fallout that was caused by the atomic modesetting
driver conversion and some last-minute changes in the DRM atomic core.
It also fixes a bug exposed by recent changes in the clock framework
which results in non-working HDMI.

----------------------------------------------------------------
Thierry Reding (4):
      drm/tegra: hdmi: Explicitly set clock rate
      drm/tegra: dc: Reset state's active_changed field
      drm/tegra: dc: Wire up CRTC parent of atomic state
      drm/tegra: dc: Move more code into ->init()

 drivers/gpu/drm/tegra/dc.c   | 79 ++++++++++++++++++++++----------------------
 drivers/gpu/drm/tegra/hdmi.c |  8 +++++
 2 files changed, 48 insertions(+), 39 deletions(-)
