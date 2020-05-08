From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v5.7
Date: Fri,  8 May 2020 12:13:55 +0200
Message-ID: <20200508101355.3031268-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-fixes

for you to fetch changes up to 4010e729349fcab69183f338fe3743df17a473a0:

  gpu: host1x: Use SMMU on Tegra124 and Tegra210 (2020-04-28 11:44:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.7

This contains a pair of patches which fix SMMU support on Tegra124 and
Tegra210 for host1x and the Tegra DRM driver.

----------------------------------------------------------------
Thierry Reding (2):
      drm/tegra: Fix SMMU support on Tegra124 and Tegra210
      gpu: host1x: Use SMMU on Tegra124 and Tegra210

 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 59 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/host1x.h      |  3 +++
 3 files changed, 60 insertions(+), 5 deletions(-)
