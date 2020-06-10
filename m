From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v1 00/18] Support for Tegra video capture from external sensor
Date: Tue, 9 Jun 2020 23:02:22 -0700
Message-ID: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
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



Sowjanya Komatineni (18):
  dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and
    power-domains
  arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
  i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
  i2c: tegra: Fix the error path in tegra_i2c_runtime_resume
  i2c: tegra: Fix runtime resume to re-init VI I2C
  i2c: tegra: Avoid tegra_i2c_init_dma() for Tegra210 vi i2c
  media: tegra-video: Fix channel format alignment
  media: tegra-video: Enable TPG based on kernel config
  media: tegra-video: Update format lookup to offset based
  dt-bindings: tegra: Document VI and CSI port nodes
  media: tegra-video: Add support for external sensor capture
  media: tegra-video: Add support for selection ioctl ops
  gpu: host1x: mipi: Add of_tegra_mipi_request() API
  gpu: host1x: mipi: Split tegra_mipi_calibrate and tegra_mipi_wait
  media: tegra-video: Add CSI MIPI pads calibration
  media: tegra-video: Compute settle times based on the clock rate
  arm64: tegra: jetson-tx1: Add camera supplies
  arm64: tegra: Enable Tegra VI CSI support for Jetson Nano

 .../display/tegra/nvidia,tegra20-host1x.txt        |  87 +++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  41 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  10 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   6 +
 drivers/gpu/drm/tegra/dsi.c                        |   7 +-
 drivers/gpu/host1x/mipi.c                          |  33 +-
 drivers/i2c/busses/i2c-tegra.c                     |  41 +-
 drivers/staging/media/tegra-video/Kconfig          |   7 +
 drivers/staging/media/tegra-video/csi.c            | 245 ++++++-
 drivers/staging/media/tegra-video/csi.h            |   9 +
 drivers/staging/media/tegra-video/tegra210.c       |  25 +-
 drivers/staging/media/tegra-video/vi.c             | 770 +++++++++++++++++++--
 drivers/staging/media/tegra-video/vi.h             |  23 +-
 drivers/staging/media/tegra-video/video.c          |  23 +-
 include/linux/host1x.h                             |   3 +
 16 files changed, 1253 insertions(+), 96 deletions(-)

-- 
2.7.4
