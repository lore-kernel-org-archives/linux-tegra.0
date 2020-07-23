From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v4 00/14] Support for Tegra video capture from external sensor
Date: Thu, 23 Jul 2020 16:50:58 -0700
Message-ID: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This series adds support for video capture from external camera sensor to
Tegra video driver.

Jetson TX1 has camera expansion connector and supports custom camera module
designed as per TX1 design specification.

This series also enables camera capture support for Jetson Nano which has
Raspberry PI camera header.

This series is tested with IMX219 camera sensor.

This series include,

VI I2C related fixes
- Camera sensor programming happens through VI I2C which is on host1x bus.
- These patches includes device tree and I2C driver fixes for VI I2C.

Tegra video driver updates
- TPG Vs Non-TPG based on Kconfig
- Support for external sensor video capture based on device graph from DT.
- Support for selection ioctl operations
- Tegra MIPI CSI pads calibration
- CSI T-CLK and T-HS settle time computation based on clock rates.

Host1x driver updates
- Adds API to allow creating mipi device for specific device node.
- Splits MIPI pads calibrate start and waiting for calibration to be done.

Device tree updates
- Adds camera connector 2V8, 1V8, 1V2 regulator supplies to Jetson TX1 DT.
- Enabled VI and CSI support in Jetson Nano DT.


Delta between patch versions:
[v4]:	Includes below fix based on v3 feedback
	- Patches are based on latest linux-next.
	- With split of tegra_mipi_calibrate() and tegra_mipi_wait(), mipi
	  clock is not left enabled till calibration done. This series adds
	  a patch to fix this by keeping clock enabled till calibration is
	  done.

	Note:
	Patch-0010 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/

[v3]:	Includes v2 feedback
	- Uses separate helper function for retrieving remote csi subdevice
	  and source subdevice.
	- Added check for presence of subdevice ops set/get_selection
	- dropped vb2_queue_release from driver and using
	  vb2_video_unregister_device instead of video_unregister_device.
	- video device register should happen in the last after all video
	  device related setup is done in the driver. This is being addressed
	  in below RFC patch. Once proper implementation of this is available
	  will update Tegra video driver to use split APIs and do all setup
	  prior to device register. Added this as TODO in the driver.
	  https://www.spinics.net/lists/linux-media/msg172761.html

	Note:
	Patch-0012 has compilation dependency on
	https://patchwork.kernel.org/patch/11659521/


[v2]:	Includes below changes based on v1 feedback
	- dt-binding document and the driver update for device graph to use
	  separate ports for sink endpoint and source endpoint for csi.
	- Use data-lanes endpoint property for csi.
	- Update tegra_mipi_request() to take device node pointer argument
	  rather than adding extra API.
	- Remove checking for clk pointer before clk_disable.


Sowjanya Komatineni (14):
  i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
  i2c: tegra: Remove NULL pointer check before
    clk_enable/disable/prepare/unprepare
  i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
  i2c: tegra: Fix runtime resume to re-init VI I2C
  i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
  media: tegra-video: Fix channel format alignment
  media: tegra-video: Enable TPG based on kernel config
  media: tegra-video: Update format lookup to offset based
  dt-bindings: tegra: Update VI and CSI bindings with port info
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Keep MIPI clock enabled till calibration is done
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate

 .../display/tegra/nvidia,tegra20-host1x.txt        |  92 ++-
 drivers/gpu/drm/tegra/dsi.c                        |   4 +-
 drivers/gpu/host1x/mipi.c                          |  19 +-
 drivers/i2c/busses/i2c-tegra.c                     | 101 +--
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 258 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   8 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 800 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  25 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   5 +-
 12 files changed, 1224 insertions(+), 143 deletions(-)

-- 
2.7.4
