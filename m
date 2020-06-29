From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/6] Tegra DRM / Host1x drivers improvements and corrections
Date: Mon, 29 Jun 2020 06:18:36 +0300
Message-ID: <20200629031842.32463-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello!

This small series fixes a few minor long-standing problems of the
Tegra DRM and Host1x drivers. It also adds a push buffer dumping support,
which is a minor debugging feature.

Changelog:

v2: - The drm/tegra and host1x patches got aggregated into this common
      series because I'm a bit worried that the standalone patches may
      become forgotten for a long time.

    - In the patch "gpu: host1x: debug: Dump push buffer state" I fixed
      the printk formatting problem on ARM64 that was reported by kernel
      test robot for a previous version of this patch.

Dmitry Osipenko (6):
  drm/tegra: gr3d: Assert reset before power-gating
  drm/tegra: gr2d: Add tiled PATBASE address register
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/drm/tegra/gr2d.c     |  1 +
 drivers/gpu/drm/tegra/gr2d.h     |  1 +
 drivers/gpu/drm/tegra/gr3d.c     |  2 ++
 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 6 files changed, 34 insertions(+), 7 deletions(-)

-- 
2.26.0
