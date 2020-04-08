From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7 devices
Date: Wed,  8 Apr 2020 23:39:39 +0300
Message-ID: <20200408203945.10329-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, =?UTF-8?q?Pedro=20=C3=82ngelo?= <pangelo@void.io>, Matt Merhar <mattmerhar@protonmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series introduces upstream kernel support for Acer Iconia Tab A500
and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
in advance.

Changelog:

v3: - Improved device-tree node-names in accordance to review comments that
      were made by Thierry Reding to v2.

    - Corrected LVDS encoder powerdown-GPIO polarity on both A500 and Nexus 7
      because I implemented the DRM bridges support in the Tegra DRM driver
      and found that there was a mistake in the device-trees. The updated
      polarity also matches the boards schematics. Now DRM bridges support
      becomes mandatory since LVDS is getting disabled during of the encoder
      driver probing. I'll send the DRM patch separately from this series.

    - Replaced recently deprecated CONFIG_DRM_LVDS_ENCODER with the new
      CONFIG_DRM_LVDS_CODEC in tegra_defconfig.

    - Added more config options to tegra_defconfig, like pstore and thermal.

    - Added atmel,cfg_name to the A500 DT, which is a new upcoming property
      in 5.8+ that allows to specify the per-board hardware config file name.

v2: - Corrected "volume down" key-label in the grouper's device-tree and
      improved some other names in device-trees.

    - Added optional (upcoming in 5.8+) VDD/AVDD regulators to the touchscreen
      node in A500 device-tree.

Dmitry Osipenko (6):
  ARM: tegra: Add device-tree for Acer Iconia Tab A500
  ARM: tegra: Add device-tree for ASUS Google Nexus 7
  dt-bindings: Add vendor prefix for Acer Inc.
  dt-bindings: ARM: tegra: Add Acer Iconia Tab A500
  dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
  ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500

 .../devicetree/bindings/arm/tegra.yaml        |   10 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/Makefile                    |    3 +
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 1458 +++++++++
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 2646 +++++++++++++++++
 .../boot/dts/tegra30-asus-nexus7-grouper.dts  |  463 +++
 .../boot/dts/tegra30-asus-nexus7-tilapia.dts  |  549 ++++
 arch/arm/configs/tegra_defconfig              |   38 +
 8 files changed, 5169 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dts

-- 
2.25.1
