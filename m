From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/22] Tegra DRM fixes
Date: Tue, 23 May 2017 03:14:15 +0300
Message-ID: <cover.1495498184.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hello,

I have already sent some of the patches contained in this series and some
of them got reviews. Later I added couple more patches and the dependencies
started to form, so please ignore all the patches I sent before this series.
The patches without r-b signatures require a review.

Dmitry Osipenko (21):
  drm/tegra: Fix lockup on a use of staging API
  drm/tegra: Correct idr_alloc() minimum id
  drm/tegra: Check whether page belongs to BO in tegra_bo_kmap()
  drm/tegra: Check for malformed offsets and sizes in the 'submit' IOCTL
  drm/tegra: Correct copying of waitchecks and disable them in the
    'submit' IOCTL
  drm/tegra: Check syncpoint ID in the 'submit' IOCTL
  drm/tegra: Remove module ownership from the tegra_fb_ops
  drm/tegra: dc: Drop the reset asserts to workaround a bug
  drm/tegra: dc: Apply clipping to the plane
  drm/tegra: Disable plane if it is invisible
  gpu: host1x: Initialize firewall class to the jobs one
  gpu: host1x: Correct host1x_job_pin() error handling
  gpu: host1x: Do not leak BO's phys address to userspace
  gpu: host1x: Forbid relocation address shifting in the firewall
  gpu: host1x: Forbid RESTART opcode in the firewall
  gpu: host1x: Forbid unrelated SETCLASS opcode in the firewall
  gpu: host1x: Check waits in the firewall
  gpu: host1x: Remove unused 'struct host1x_cmdbuf'
  gpu: host1x: Remove unused host1x_cdma_stop() definition
  drm/tegra: Don't use IOMMU on Tegra20
  Revert "iommu/tegra: gart: Do not register with bus"

Mikko Perttunen (1):
  gpu: host1x: Refactor channel allocation code

 drivers/gpu/drm/tegra/dc.c         |  77 ++++++++++---------
 drivers/gpu/drm/tegra/drm.c        | 145 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/drm.h        |   1 +
 drivers/gpu/drm/tegra/fb.c         |   1 -
 drivers/gpu/drm/tegra/gem.c        |   8 +-
 drivers/gpu/drm/tegra/gem.h        |   5 ++
 drivers/gpu/drm/tegra/gr2d.c       |  16 +++-
 drivers/gpu/drm/tegra/gr3d.c       |   4 +-
 drivers/gpu/drm/tegra/vic.c        |   4 +-
 drivers/gpu/host1x/cdma.h          |   1 -
 drivers/gpu/host1x/channel.c       | 147 +++++++++++++++++++++++--------------
 drivers/gpu/host1x/channel.h       |  21 ++++--
 drivers/gpu/host1x/debug.c         |  47 +++++-------
 drivers/gpu/host1x/dev.c           |  12 ++-
 drivers/gpu/host1x/dev.h           |   6 +-
 drivers/gpu/host1x/hw/channel_hw.c |   4 -
 drivers/gpu/host1x/job.c           | 113 ++++++++++++++++++++++------
 drivers/gpu/host1x/job.h           |  14 ----
 drivers/iommu/tegra-gart.c         |   2 +-
 include/linux/host1x.h             |  13 +++-
 20 files changed, 426 insertions(+), 215 deletions(-)

-- 
2.13.0
