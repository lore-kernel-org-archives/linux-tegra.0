From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] drm/tegra: Changes for v4.8-rc1
Date: Thu, 14 Jul 2016 15:59:31 +0200
Message-ID: <20160714135931.6127-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.8-rc1

for you to fetch changes up to 64ea25c3bc86c05c7da6c683b86663f4c90158d6:

  drm/tegra: sor: Reject HDMI 2.0 modes (2016-07-14 14:57:04 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v4.8-rc1

This set of changes contains a bunch of cleanups to the host1x driver as
well as the addition of a pin controller for DPAUX, which is required by
boards to configure the DPAUX pads in AUX mode (for DisplayPort) or I2C
mode (for HDMI and DDC).

Included is also a bit of rework of the SOR driver in preparation to add
DisplayPort support as well as some refactoring and cleanup.

Finally, all output drivers are converted to runtime PM, which greatly
simplifies the handling of clocks and resets.

----------------------------------------------------------------
Bhaktipriya Shridhar (1):
      gpu: host1x: hw: intr_hw: Remove create_workqueue

Jon Hunter (9):
      pinctrl: pinconf: Add generic helper function for freeing mappings
      drm/tegra: dpaux: Clean-up on probe failure
      drm/tegra: dpaux: Add helpers for setting up pads
      dt-bindings: display: Update Tegra DPAUX documentation
      drm/tegra: Prepare DPAUX for supporting generic PM domains
      dt-bindings: Add bindings for Tegra DPAUX pinctrl driver
      drm/tegra: dpaux: Add pinctrl support
      drm/tegra: dsi: Prepare for generic PM domain support
      drm/tegra: sor: Prepare for generic PM domain support

Thierry Reding (26):
      Merge branch 'devel-dt-free-map' of git://git.kernel.org/.../linusw/linux-pinctrl into drm/tegra/for-next
      gpu: host1x: Consistently use unsigned int for counts
      gpu: host1x: Use unsigned int consistently for IDs
      gpu: host1x: channel: Use correct type
      gpu: host1x: cdma: Drop unnecessary local variable
      gpu: host1x: syncpt: Use kcalloc() instead of kzalloc()
      gpu: host1x: Fix a couple of checkpatch warnings
      gpu: host1x: Whitespace cleanup for readability
      gpu: host1x: Remove redundant parentheses
      gpu: host1x: Constify array of action handlers
      gpu: host1x: Remove useless local variable
      drm/tegra: sor: Factor out tegra_sor_set_parent_clock()
      drm/tegra: sor: Rename tegra_sor_calc_config()
      drm/tegra: sor: Split out tegra_sor_apply_config()
      drm/tegra: sor: Extract tegra_sor_mode_set()
      drm/tegra: sor: Do not support deep color modes
      drm/tegra: hdmi: Enable audio over HDMI
      drm/tegra: dc: Implement runtime PM
      drm/tegra: dsi: Implement runtime PM
      drm/tegra: hdmi: Implement runtime PM
      drm/tegra: sor: Implement runtime PM
      drm/tegra: sor: Implement sor1_brick clock
      dt-bindings: display: tegra: Add source clock for SOR
      drm/tegra: sor: Use sor1_src clock to set parent for HDMI
      drm/tegra: sor: Make XBAR configurable per SoC
      drm/tegra: sor: Reject HDMI 2.0 modes

 .../display/tegra/nvidia,tegra20-host1x.txt        |  13 +-
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |  60 ++
 drivers/gpu/drm/tegra/dc.c                         | 176 +++--
 drivers/gpu/drm/tegra/dpaux.c                      | 245 +++++--
 drivers/gpu/drm/tegra/drm.c                        |   2 +-
 drivers/gpu/drm/tegra/dsi.c                        | 247 ++++---
 drivers/gpu/drm/tegra/hdmi.c                       | 507 +++++++++++----
 drivers/gpu/drm/tegra/hdmi.h                       |  21 +-
 drivers/gpu/drm/tegra/output.c                     |   1 +
 drivers/gpu/drm/tegra/sor.c                        | 716 ++++++++++++++-------
 drivers/gpu/drm/tegra/sor.h                        |   3 +
 drivers/gpu/host1x/cdma.c                          |  42 +-
 drivers/gpu/host1x/channel.c                       |   5 +-
 drivers/gpu/host1x/debug.c                         |  38 +-
 drivers/gpu/host1x/dev.c                           |  16 +-
 drivers/gpu/host1x/dev.h                           |  38 +-
 drivers/gpu/host1x/hw/cdma_hw.c                    |  23 +-
 drivers/gpu/host1x/hw/channel_hw.c                 |   5 +-
 drivers/gpu/host1x/hw/debug_hw.c                   |  36 +-
 drivers/gpu/host1x/hw/intr_hw.c                    |  30 +-
 drivers/gpu/host1x/hw/syncpt_hw.c                  |  10 +-
 drivers/gpu/host1x/intr.c                          |  16 +-
 drivers/gpu/host1x/intr.h                          |   4 +-
 drivers/gpu/host1x/job.c                           |   8 +-
 drivers/gpu/host1x/syncpt.c                        |  58 +-
 drivers/gpu/host1x/syncpt.h                        |   8 +-
 drivers/pinctrl/pinconf-generic.c                  |   8 +
 include/linux/pinctrl/pinconf-generic.h            |   2 +
 28 files changed, 1636 insertions(+), 702 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
