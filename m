From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.4-rc1
Date: Fri, 30 Oct 2015 18:50:30 +0100
Message-ID: <1446227430-18735-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.4-rc1

for you to fetch changes up to 2bcdcbfae2895764372ef973a969f395a548f1ea:

  drm/tegra: dc: Request/free syncpoint at init/exit (2015-10-30 18:40:52 +0100)

I realize this is awfully late, but I guess I was ashamed of the amount
of work that this contains and was waiting for something else to show
up. Nothing did, so it's really just a few patches of cleanup work.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.4-rc1

Just a couple of minor fixes and cleanups for this cycle.

----------------------------------------------------------------
Dmitry Osipenko (1):
      gpu: host1x: Fix MLOCK's debug info

Thierry Reding (2):
      drm/tegra: fb: Remove gratuituous blank line
      drm/tegra: dc: Request/free syncpoint at init/exit

 drivers/gpu/drm/tegra/dc.c               | 14 +++++++-------
 drivers/gpu/drm/tegra/fb.c               |  1 -
 drivers/gpu/host1x/hw/debug_hw.c         |  2 +-
 drivers/gpu/host1x/hw/hw_host1x01_sync.h |  8 ++++----
 drivers/gpu/host1x/hw/hw_host1x02_sync.h |  8 ++++----
 drivers/gpu/host1x/hw/hw_host1x04_sync.h |  8 ++++----
 6 files changed, 20 insertions(+), 21 deletions(-)
