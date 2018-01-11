From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v4.15-rc1
Date: Thu, 11 Jan 2018 17:41:17 +0100
Message-ID: <20180111164117.22150-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

  Merge branch 'linux-4.15' of git://github.com/skeggsb/linux into drm-fixes (2018-01-09 12:03:10 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.15-rc8

for you to fetch changes up to d780537f9b49e9d714a454e5ed989d909beab8ec:

  drm/tegra: sor: Fix hang on Tegra124 eDP (2018-01-10 13:04:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v4.15-rc8

A single fix for a Tegra124 eDP regression introduced by the SOR changes
in v4.15-rc1.

----------------------------------------------------------------
Thierry Reding (1):
      drm/tegra: sor: Fix hang on Tegra124 eDP

 drivers/gpu/drm/tegra/sor.c | 3 +++
 1 file changed, 3 insertions(+)
