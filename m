From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 18:10:42 +0100
Message-ID: <20200313171042.2924890-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-rc1

for you to fetch changes up to e32c8c2a5fbe1514e4ae9063a49e76ecf486ffb8:

  drm/tegra: hdmi: Silence deferred-probe error (2020-03-13 18:03:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.7-rc1

This contains some minor cleanups, nothing too exciting.

----------------------------------------------------------------
Dmitry Osipenko (4):
      drm/tegra: dc: Use devm_platform_ioremap_resource
      drm/tegra: dc: Release PM and RGB output when client's registration fails
      drm/tegra: dc: Silence RGB output deferred-probe error
      drm/tegra: hdmi: Silence deferred-probe error

 drivers/gpu/drm/tegra/dc.c   | 20 +++++++++++++++-----
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 14 deletions(-)
