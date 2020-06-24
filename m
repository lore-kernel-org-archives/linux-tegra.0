From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Fixes for v5.8-rc3
Date: Wed, 24 Jun 2020 18:52:54 +0200
Message-ID: <20200624165254.2763104-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.8-rc3

for you to fetch changes up to fce3a51d9b31312aa12ecb72ffabfc4c7b40bdc6:

  drm/tegra: Add zpos property for cursor planes (2020-06-16 19:03:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.8-rc3

This contains a fairly random assortment of fixes for various minor
issues.

----------------------------------------------------------------
Christophe JAILLET (1):
      gpu: host1x: Clean up debugfs in error handling path

Colton Lewis (1):
      gpu: host1x: Correct trivial kernel-doc inconsistencies

Nicolin Chen (1):
      drm/tegra: hub: Do not enable orphaned window group

Thierry Reding (4):
      gpu: host1x: Register child devices
      drm/tegra: hub: Register child devices
      gpu: host1x: Detach driver on unregister
      drm/tegra: Add zpos property for cursor planes

 drivers/gpu/drm/tegra/dc.c  |  1 +
 drivers/gpu/drm/tegra/hub.c | 17 +++++++++++++++--
 drivers/gpu/host1x/bus.c    |  9 +++++++++
 drivers/gpu/host1x/dev.c    | 11 +++++++++--
 include/linux/host1x.h      |  3 +++
 5 files changed, 37 insertions(+), 4 deletions(-)
