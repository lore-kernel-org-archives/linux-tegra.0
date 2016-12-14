From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/7] Host1x IOMMU support + VIC support
Date: Wed, 14 Dec 2016 13:16:10 +0200
Message-ID: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This series adds IOMMU support to Host1x and TegraDRM
and adds support for the VIC (Video Image Compositor)
host1x client. The series is available as a git repository at
git://github.com/cyndis/linux.git; branch vic-2.

A userspace test case for VIC can be found at
https://github.com/cyndis/drm/tree/work/tegra.
The testcase is in tests/tegra and is called submit_vic.
The testcase/TRM include full headers and documentation
to program the unit. The unit by itself, however, does not
readily map to existing userspace library interfaces, so
implementations for those are not provided.

The in-kernel firewall is not implemented for VIC;
therefore, either the IOMMU must be enabled or the firewall
disabled for the test to pass.

Tested with Jetson TX1 (T210). Probably works also
with Jetson TK1 (T124). Note that due to hardware changes
the testcase also needs to be changed to run properly
on T124: this can be done by removing the topmost
commit of the aforementioned test repository.

Thanks,
  Mikko.

Arto Merilainen (2):
  drm/tegra: Add falcon helper library
  drm/tegra: Add VIC support

Mikko Perttunen (5):
  drm/tegra: Add Tegra DRM allocation API
  gpu: host1x: Add IOMMU support
  dt-bindings: Add bindings for the Tegra VIC
  arm64: tegra: Enable VIC on T210
  arm64: tegra: Enable IOMMU for Host1x on Tegra210

 .../display/tegra/nvidia,tegra20-host1x.txt        |  13 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 +-
 drivers/gpu/drm/tegra/Makefile                     |   4 +-
 drivers/gpu/drm/tegra/drm.c                        | 114 +++++-
 drivers/gpu/drm/tegra/drm.h                        |  12 +
 drivers/gpu/drm/tegra/falcon.c                     | 259 ++++++++++++++
 drivers/gpu/drm/tegra/falcon.h                     | 127 +++++++
 drivers/gpu/drm/tegra/vic.c                        | 396 +++++++++++++++++++++
 drivers/gpu/drm/tegra/vic.h                        |  31 ++
 drivers/gpu/host1x/cdma.c                          |  74 +++-
 drivers/gpu/host1x/cdma.h                          |   6 +-
 drivers/gpu/host1x/dev.c                           |  40 ++-
 drivers/gpu/host1x/dev.h                           |   6 +
 drivers/gpu/host1x/hw/cdma_hw.c                    |  16 +-
 drivers/gpu/host1x/job.c                           |  72 +++-
 drivers/gpu/host1x/job.h                           |   1 +
 include/linux/host1x.h                             |   1 +
 17 files changed, 1143 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/falcon.c
 create mode 100644 drivers/gpu/drm/tegra/falcon.h
 create mode 100644 drivers/gpu/drm/tegra/vic.c
 create mode 100644 drivers/gpu/drm/tegra/vic.h

-- 
2.10.2
