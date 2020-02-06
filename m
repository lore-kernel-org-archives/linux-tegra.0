From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v5.6-rc1
Date: Thu,  6 Feb 2020 18:27:53 +0100
Message-ID: <20200206172753.2185390-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1-fixes

for you to fetch changes up to 98ae41adb252866158dd4e998551dfa85e612bed:

  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects (2020-02-06 18:23:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.6-rc1

These are a couple of quick fixes for regressions that were found during
the first two weeks of the merge window.

----------------------------------------------------------------
Thierry Reding (6):
      drm/tegra: sor: Suspend on clock registration failure
      drm/tegra: sor: Disable runtime PM on probe failure
      drm/tegra: sor: Initialize runtime PM before use
      drm/tegra: Relax IOMMU usage criteria on old Tegra
      drm/tegra: Reuse IOVA mapping where possible
      gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 ++++++++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/sor.c   | 49 ++++++++++++++++++++++++-------------------
 drivers/gpu/host1x/job.c      | 34 ++++++++++++++++++++++++++----
 5 files changed, 123 insertions(+), 63 deletions(-)
