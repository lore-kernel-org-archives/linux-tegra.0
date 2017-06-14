From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 00/20] Tegra DRM fixes
Date: Thu, 15 Jun 2017 02:18:23 +0300
Message-ID: <cover.1497480751.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I've dropped the two "GART restoring" patches from the series, postponing
them till a full solution of GART utilization would be ready.

The "Forbid relocation address shifting in the firewall" patch has been
reverted to v1, Mikko and me agreed on that it is a reasonable variant.

All the patches got a r-b, series should be good to go.

Dmitry Osipenko (19):
  drm/tegra: Fix lockup on a use of staging API
  drm/tegra: Correct idr_alloc() minimum id
  drm/tegra: Check for malformed offsets and sizes in the 'submit' IOCTL
  drm/tegra: Correct copying of waitchecks and disable them in the
    'submit' IOCTL
  drm/tegra: Check syncpoint ID in the 'submit' IOCTL
  drm/tegra: dc: Avoid reset asserts on Tegra20
  drm/tegra: dc: Apply clipping to the plane
  drm/tegra: dc: Disable plane if it is invisible
  gpu: host1x: Initialize firewall class to the jobs one
  gpu: host1x: Correct host1x_job_pin() error handling
  gpu: host1x: Do not leak BO's phys address to userspace
  gpu: host1x: Forbid relocation address shifting in the firewall
  gpu: host1x: Forbid RESTART opcode in the firewall
  gpu: host1x: Forbid unrelated SETCLASS opcode in the firewall
  gpu: host1x: Correct swapped arguments in the is_addr_reg() definition
  gpu: host1x: Check waits in the firewall
  gpu: host1x: Remove unused 'struct host1x_cmdbuf'
  gpu: host1x: Remove unused host1x_cdma_stop() definition
  gpu: host1x: At first try a non-blocking allocation for the gather
    copy

Mikko Perttunen (1):
  gpu: host1x: Refactor channel allocation code

 drivers/gpu/drm/tegra/dc.c         |  92 +++++++++++++++--------
 drivers/gpu/drm/tegra/drm.c        | 141 +++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/drm.h        |   1 +
 drivers/gpu/drm/tegra/gem.c        |   5 --
 drivers/gpu/drm/tegra/gem.h        |   5 ++
 drivers/gpu/drm/tegra/gr2d.c       |  11 ++-
 drivers/gpu/drm/tegra/gr3d.c       |   4 +-
 drivers/gpu/drm/tegra/vic.c        |   4 +-
 drivers/gpu/host1x/cdma.h          |   1 -
 drivers/gpu/host1x/channel.c       | 147 +++++++++++++++++++++++--------------
 drivers/gpu/host1x/channel.h       |  21 ++++--
 drivers/gpu/host1x/debug.c         |  47 +++++-------
 drivers/gpu/host1x/dev.c           |   7 +-
 drivers/gpu/host1x/dev.h           |   6 +-
 drivers/gpu/host1x/hw/channel_hw.c |   4 -
 drivers/gpu/host1x/job.c           | 124 ++++++++++++++++++++++++-------
 drivers/gpu/host1x/job.h           |  14 ----
 include/linux/host1x.h             |  13 +++-
 18 files changed, 440 insertions(+), 207 deletions(-)

-- 
2.13.0
