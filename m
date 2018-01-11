From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.16-rc1 (with fixes)
Date: Thu, 11 Jan 2018 17:53:03 +0100
Message-ID: <20180111165303.23320-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit ebae8d07435ae91314f4a28d69b530d09c625815:

  drm/tegra: dc: Implement legacy blending (2017-12-21 14:55:55 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.16-rc1-fixes

for you to fetch changes up to 8f62142e490d761ceb92b55a7c05bb79294d6c6c:

  drm/tegra: dc: Properly cleanup overlay planes (2018-01-08 16:24:13 +0100)

This has fixes for the issues that Dmitry had pointed out in response to
my first pull request. It is based on top of my earlier pull request, so
I've only included the shortlog of the changes since then. It should be
safe to pull only this one in order to get all of the other changes as
well.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.16-rc1

The bulk of these changes are preparation work and addition of support
for Tegra186. Currently only HDMI output (the primary output on Jetson
TX2) is supported, but the hardware is also capable of doing DSI and
DisplayPort.

Tegra DRM now also uses the atomic commit helpers instead of the open-
coded variant that was only doing half its job. As a bit of a byproduct
of the Tegra186 support the driver also gained HDMI 2.0 as well as zpos
property support.

Along the way there are also a few patches to clean up a few things and
fix minor issues.

----------------------------------------------------------------
Thierry Reding (3):
      drm/tegra: dc: Restore YUV overlay support
      drm/tegra: dc: Fix possible_crtcs mask for planes
      drm/tegra: dc: Properly cleanup overlay planes

 drivers/gpu/drm/tegra/dc.c    | 35 +++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/plane.c |  5 +++++
 2 files changed, 28 insertions(+), 12 deletions(-)
