From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.14-rc1
Date: Fri, 18 Aug 2017 17:26:31 +0200
Message-ID: <20170818152631.18999-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.14-rc1

for you to fetch changes up to ec73c4cfe7de6229e49989f7d7754a7039cd5c28:

  drm/tegra: Prevent BOs from being freed during job submission (2017-08-17 17:57:18 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.14-rc1

This contains a couple of fixes and improvements for host1x, with some
preparatory work for Tegra186 support.

The remainder is cleanup and minor bugfixes for Tegra DRM along with
enhancements to debuggability.

There have also been some enhancements to the kernel interfaces for
host1x job submissions and support for mmap'ing PRIME buffers directly,
all of which get the interfaces very close to ready for serious work.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: Add CONFIG_OF dependency

Cihangir Akturk (1):
      drm/tegra: switch to drm_*_get(), drm_*_put() helpers

Dmitry Osipenko (1):
      drm/tegra: Prevent BOs from being freed during job submission

Gustavo A. R. Silva (1):
      gpu: host1x: fix error return code in host1x_probe()

Michał Mirosław (1):
      drm/tegra: Fix NULL deref in debugfs/iova

Mikko Perttunen (2):
      gpu: host1x: Don't fail on NULL bo physical address
      gpu: host1x: Fix bitshift/mask multipliers

Nicolas Chauvet (1):
      drm/tegra: Set MODULE_FIRMWARE for the VIC

Thierry Reding (13):
      gpu: host1x: Support sub-devices recursively
      drm/tegra: dc: Use unsigned int for register offsets
      drm/tegra: dpaux: Use unsigned int for register offsets
      drm/tegra: dsi: Use unsigned int for register offsets
      drm/tegra: hdmi: Use unsigned int for register offsets
      drm/tegra: sor: Use unsigned int for register offsets
      drm/tegra: dc: Trace register accesses
      drm/tegra: hdmi: Trace register accesses
      drm/tegra: dsi: Trace register accesses
      drm/tegra: dpaux: Trace register accesses
      drm/tegra: sor: Trace register accesses
      drm/tegra: Support render node
      drm/tegra: gem: Implement mmap() for PRIME buffers

 drivers/gpu/drm/tegra/Kconfig     |   1 +
 drivers/gpu/drm/tegra/Makefile    |   2 +
 drivers/gpu/drm/tegra/dpaux.c     |  12 +++--
 drivers/gpu/drm/tegra/drm.c       | 102 ++++++++++++++++++++++++++------------
 drivers/gpu/drm/tegra/drm.h       |  12 +++--
 drivers/gpu/drm/tegra/dsi.c       |  14 ++++--
 drivers/gpu/drm/tegra/fb.c        |   8 +--
 drivers/gpu/drm/tegra/gem.c       |  59 ++++++++++++++--------
 drivers/gpu/drm/tegra/hdmi.c      |  12 +++--
 drivers/gpu/drm/tegra/sor.c       |  12 +++--
 drivers/gpu/drm/tegra/trace.c     |   2 +
 drivers/gpu/drm/tegra/trace.h     |  68 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/vic.c       |  15 +++++-
 drivers/gpu/host1x/bus.c          |  18 ++++++-
 drivers/gpu/host1x/dev.c          |   4 +-
 drivers/gpu/host1x/hw/intr_hw.c   |  24 ++++-----
 drivers/gpu/host1x/hw/syncpt_hw.c |   2 +-
 drivers/gpu/host1x/job.c          |   8 ---
 18 files changed, 277 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/trace.c
 create mode 100644 drivers/gpu/drm/tegra/trace.h
