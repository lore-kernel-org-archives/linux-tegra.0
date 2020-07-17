From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:20:11 +0200
Message-ID: <20200717162011.1661788-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit fce3a51d9b31312aa12ecb72ffabfc4c7b40bdc6:

  drm/tegra: Add zpos property for cursor planes (2020-06-16 19:03:25 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.9-rc1

for you to fetch changes up to 4fba6d22ca9ad28b8871d763b35a4da2e1ca272e:

  drm/tegra: plane: Support 180° rotation (2020-07-17 16:06:17 +0200)

Note that I've supplied the ssh:// URL above as opposed to the git://
URL that I usually use. The latter has been somewhat spotty for me. Let
me know if this is causing any issues.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.9-rc1

This set of patches contains a few preparatory patches to enable video
capture support from external camera modules. This is a dependency for
the V4L2 driver patches that will likely be merged in v5.9 or v5.10.

On top of that there are a couple of fixes across the board as well as
some improvements.

From a feature point of view this also adds support for horizontal
reflection and 180° rotation of planes.

----------------------------------------------------------------
Dmitry Osipenko (9):
      gpu: host1x: Optimize BOs usage when firewall is enabled
      gpu: host1x: Put gather's BO on pinning error
      gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
      gpu: host1x: debug: Dump push buffer state
      drm/tegra: gr3d: Assert reset before power-gating
      drm/tegra: gr2d: Add tiled PATBASE address register
      drm/tegra: plane: Rename bottom_up to reflect_y
      drm/tegra: plane: Support horizontal reflection
      drm/tegra: plane: Support 180° rotation

Sowjanya Komatineni (3):
      gpu: host1x: mipi: Update tegra_mipi_request() to be node based
      gpu: host1x: mipi: Use readl_relaxed_poll_timeout() in tegra_mipi_wait()
      gpu: host1x: mipi: Split tegra_mipi_calibrate() and tegra_mipi_wait()

Tang Bin (1):
      drm/tegra: dc: Omit superfluous error message in tegra_dc_probe()

Thierry Reding (1):
      drm/tegra: sor: Use correct power supply names for HDMI

 drivers/gpu/drm/tegra/dc.c       | 50 ++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dc.h       |  3 ++-
 drivers/gpu/drm/tegra/dsi.c      |  9 ++++++--
 drivers/gpu/drm/tegra/gr2d.c     |  1 +
 drivers/gpu/drm/tegra/gr2d.h     |  1 +
 drivers/gpu/drm/tegra/gr3d.c     |  2 ++
 drivers/gpu/drm/tegra/plane.c    |  3 ++-
 drivers/gpu/drm/tegra/plane.h    |  3 ++-
 drivers/gpu/drm/tegra/sor.c      |  4 ++--
 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 +++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++------
 drivers/gpu/host1x/mipi.c        | 37 ++++++++++++++++-------------
 include/linux/host1x.h           |  4 +++-
 14 files changed, 111 insertions(+), 43 deletions(-)
