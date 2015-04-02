From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.1-rc1
Date: Thu,  2 Apr 2015 19:00:44 +0200
Message-ID: <1427994045-20405-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 13a7a6ac0a11197edcd0f756a035f472b42cdf8b:

  Linux 4.0-rc2 (2015-03-03 09:04:59 -0800)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.1-rc1

for you to fetch changes up to 535a65db484ff4e4654a037f2ea7e1ff21431b77:

  drm/tegra: sor: Reset during initialization (2015-04-02 18:49:24 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.1-rc1

Perhaps the most noteworthy change in this set is the implementation of
a hardware VBLANK counter using host1x syncpoints. The SOR registers can
now be dumped via debugfs, which can be useful while debugging. The IOVA
address space maintained by the driver can also be dumped via debugfs.

Other than than, these changes are mostly cleanup work, such as making
register names more consistent or removing unused code (that was left
over after the atomic mode-setting conversion). There's also a fix for
eDP that makes the driver cope with firmware that already initialized
the display (such as the firmware on the Tegra-based Chromebooks).

----------------------------------------------------------------
Sean Paul (1):
      drm/tegra: gem: Return 64-bit offset for mmap(2)

Thierry Reding (13):
      drm/tegra: dc: Check for valid parent clock
      drm/tegra: Provide debugfs file for the IOVA space
      drm/tegra: sor: Registers are 32-bit
      drm/tegra: sor: Dump registers via debugfs
      gpu: host1x: Export host1x_syncpt_read()
      drm/tegra: dc: Implement hardware VBLANK counter
      drm/atomic: Add helpers for state-subclassing drivers
      drm/tegra: dc: Use base atomic state helpers
      drm/tegra: dc: Remove unused function
      drm/tegra: dc: Remove unused callbacks
      drm/tegra: dc: Document tegra_dc_state_setup_clock()
      drm/tegra: hdmi: Resets are synchronous
      drm/tegra: hdmi: Name register fields consistently

Tomeu Vizoso (1):
      drm/tegra: sor: Reset during initialization

 drivers/gpu/drm/drm_atomic_helper.c | 144 ++++++++++++++++++++++---
 drivers/gpu/drm/tegra/dc.c          |  99 ++++++++++--------
 drivers/gpu/drm/tegra/dc.h          |   7 +-
 drivers/gpu/drm/tegra/drm.c         |  18 +++-
 drivers/gpu/drm/tegra/drm.h         |   4 +-
 drivers/gpu/drm/tegra/hdmi.c        |   4 +-
 drivers/gpu/drm/tegra/hdmi.h        |   2 +-
 drivers/gpu/drm/tegra/sor.c         | 202 +++++++++++++++++++++++++++++++++---
 drivers/gpu/host1x/syncpt.c         |   6 ++
 include/drm/drm_atomic_helper.h     |  14 +++
 include/linux/host1x.h              |   1 +
 include/uapi/drm/tegra_drm.h        |   3 +-
 12 files changed, 421 insertions(+), 83 deletions(-)
