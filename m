From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.3-rc1
Date: Fri, 14 Aug 2015 17:01:03 +0200
Message-ID: <1439564463-18445-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.3-rc1

for you to fetch changes up to 459cc2c6800b545a482e428a631d99bca8da7790:

  drm/tegra: sor: Add HDMI support (2015-08-13 13:49:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.3-rc1

There are a bunch of non-critical fixes here that I've collected over
the past few months, but the biggest part is Tegra210 support, in the
DC, DSI and SOR/HDMI drivers.

Also this finally restores DPMS with atomic mode-setting, something
that has been broken since the conversion and which I had originally
expected to take far less longer to fix.

----------------------------------------------------------------
Thierry Reding (41):
      gpu: host1x: mipi: Parameterize to support future SoCs
      gpu: host1x: mipi: Fix clock lane register for DSI
      gpu: host1x: mipi: Clear calibration status
      gpu: host1x: mipi: Constify OF match table
      gpu: host1x: mipi: Add Tegra132 support
      gpu: host1x: mipi: Add Tegra210 support
      gpu: host1x: mipi: Power down regulators when unused
      drm/tegra: Allow VBLANK to be disabled
      drm/tegra: Use SIMPLE_DEV_PM_OPS
      drm/tegra: output: Support low-active hotplug detect
      drm/tegra: dc: Reset VBLANK to off
      drm/tegra: dc: Add Tegra210 support
      drm/tegra: dc: Implement CRC debugfs interface
      drm/tegra: dc: Clarify comment about cursor treatment
      drm/tegra: dc: Remove gratuituous blank line
      drm/tegra: dc: Request syncpoint earlier
      drm/tegra: dc: Record statistics
      drm/tegra: dc: Rename register for consistency
      drm/tegra: dc: Don't explicitly set owner module
      drm/tegra: dc: Rename BASE_COLOR_SIZE* fields
      drm/tegra: dsi: Use proper back-porch for non-sync video mode
      drm/tegra: dsi: Add Tegra124 support
      drm/tegra: dsi: Add Tegra132 support
      drm/tegra: dsi: Add Tegra210 support
      drm/tegra: dpaux: Provide error message in probe
      drm/tegra: dpaux: Configure pads as I2C by default
      drm/tegra: dpaux: Disable interrupt when detached
      drm/tegra: sor: Rename registers for consistency
      drm/tegra: sor: Provide error messages in probe
      drm/tegra: sor: Set minor after debugfs initialization
      drm/tegra: sor: Reset the correct debugfs fields
      drm/tegra: sor: Constify display mode
      drm/tegra: sor: Write correct head state registers
      drm/tegra: sor: Use DRM debugfs infrastructure for CRC
      drm/tegra: rgb: Restore DPMS
      drm/tegra: hdmi: Restore DPMS
      drm/tegra: dsi: Restore DPMS
      drm/tegra: sor: Restore DPMS
      drm/tegra: dc: Implement atomic DPMS
      drm/tegra: sor: Add Tegra210 eDP support
      drm/tegra: sor: Add HDMI support

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |    8 +-
 drivers/gpu/drm/tegra/dc.c                         |  294 ++--
 drivers/gpu/drm/tegra/dc.h                         |   24 +-
 drivers/gpu/drm/tegra/dpaux.c                      |   63 +-
 drivers/gpu/drm/tegra/dpaux.h                      |    2 +
 drivers/gpu/drm/tegra/drm.c                        |   16 +-
 drivers/gpu/drm/tegra/drm.h                        |   10 +
 drivers/gpu/drm/tegra/dsi.c                        |  126 +-
 drivers/gpu/drm/tegra/dsi.h                        |    4 +
 drivers/gpu/drm/tegra/hdmi.c                       |   78 +-
 drivers/gpu/drm/tegra/output.c                     |   20 +-
 drivers/gpu/drm/tegra/rgb.c                        |   49 +-
 drivers/gpu/drm/tegra/sor.c                        | 1664 +++++++++++++++-----
 drivers/gpu/drm/tegra/sor.h                        |  298 ++--
 drivers/gpu/host1x/mipi.c                          |  253 ++-
 15 files changed, 2104 insertions(+), 805 deletions(-)
