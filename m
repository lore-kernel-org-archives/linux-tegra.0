From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.13-rc1
Date: Fri, 16 Jun 2017 09:54:51 +0200
Message-ID: <20170616075451.10443-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.13-rc1

for you to fetch changes up to 43240bbd871e2c8f89584d369278a3d18680d9ea:

  gpu: host1x: At first try a non-blocking allocation for the gather copy (2017-06-15 14:25:56 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.13-rc1

This starts off with the addition of more documentation for the host1x
and DRM drivers and finishes with a slew of fixes and enhancements for
the staging IOCTLs as a result of the awesome work done by Dmitry and
Erik on the grate reverse-engineering effort.

----------------------------------------------------------------
Dmitry Osipenko (17):
      drm/tegra: Check for malformed offsets and sizes in the 'submit' IOCTL
      drm/tegra: Correct copying of waitchecks and disable them in the 'submit' IOCTL
      drm/tegra: Check syncpoint ID in the 'submit' IOCTL
      drm/tegra: dc: Avoid reset asserts on Tegra20
      drm/tegra: dc: Apply clipping to the plane
      drm/tegra: dc: Disable plane if it is invisible
      gpu: host1x: Initialize firewall class to the job's one
      gpu: host1x: Correct host1x_job_pin() error handling
      gpu: host1x: Do not leak BO's phys address to userspace
      gpu: host1x: Forbid relocation address shifting in the firewall
      gpu: host1x: Forbid RESTART opcode in the firewall
      gpu: host1x: Forbid unrelated SETCLASS opcode in the firewall
      gpu: host1x: Correct swapped arguments in the is_addr_reg() definition
      gpu: host1x: Check waits in the firewall
      gpu: host1x: Remove unused 'struct host1x_cmdbuf'
      gpu: host1x: Remove unused host1x_cdma_stop() definition
      gpu: host1x: At first try a non-blocking allocation for the gather copy

Mikko Perttunen (1):
      gpu: host1x: Refactor channel allocation code

Thierry Reding (2):
      gpu: host1x: Flesh out kerneldoc
      drm/tegra: Add driver documentation

 Documentation/gpu/index.rst        |   1 +
 Documentation/gpu/tegra.rst        | 178 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c         |  92 +++++++++++++------
 drivers/gpu/drm/tegra/drm.c        | 119 ++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/drm.h        |   1 +
 drivers/gpu/drm/tegra/gem.c        |   5 --
 drivers/gpu/drm/tegra/gem.h        |   5 ++
 drivers/gpu/drm/tegra/gr2d.c       |  11 ++-
 drivers/gpu/drm/tegra/gr3d.c       |   4 +-
 drivers/gpu/drm/tegra/vic.c        |   4 +-
 drivers/gpu/host1x/bus.c           |  75 ++++++++++++++++
 drivers/gpu/host1x/cdma.h          |   1 -
 drivers/gpu/host1x/channel.c       | 147 ++++++++++++++++++------------
 drivers/gpu/host1x/channel.h       |  21 +++--
 drivers/gpu/host1x/debug.c         |  47 ++++------
 drivers/gpu/host1x/dev.c           |   7 +-
 drivers/gpu/host1x/dev.h           |   6 +-
 drivers/gpu/host1x/hw/channel_hw.c |   4 -
 drivers/gpu/host1x/job.c           | 124 ++++++++++++++++++++------
 drivers/gpu/host1x/job.h           |  14 ---
 drivers/gpu/host1x/syncpt.c        |  81 ++++++++++++++---
 include/linux/host1x.h             |  38 +++++++-
 22 files changed, 784 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/gpu/tegra.rst
