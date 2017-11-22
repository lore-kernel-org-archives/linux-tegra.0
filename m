From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v4.15-rc1
Date: Wed, 22 Nov 2017 13:29:00 +0100
Message-ID: <20171122122901.29530-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit fb83be8873909ba7c089d1c5cb72873cc2cce7d1:

  drm/tegra: hdmi: Add cec-notifier support (2017-10-20 14:19:54 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.15-rc1-fixes

for you to fetch changes up to e1335e2f0cfcd36ffa1b709ac58096134eb6e779:

  drm/tegra: sor: Reimplement pad clock (2017-11-20 13:23:54 +0100)

This is a single fix on top of the earlier pull request for Tegra. I
forgot to include this in the initial pull request, but it is required
in order to keep the SOR working with some of the changes that went in
via the clock tree.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v4.15-rc1

This includes an update to the SOR pad clock programming needed because
of some changes that went in through the clock tree.

----------------------------------------------------------------
Thierry Reding (1):
      drm/tegra: sor: Reimplement pad clock

 drivers/gpu/drm/tegra/sor.c | 157 +++++++++++++++++++++++++++++++-------------
 1 file changed, 111 insertions(+), 46 deletions(-)
