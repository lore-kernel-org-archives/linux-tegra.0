From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7 devices
Date: Wed, 22 Apr 2020 02:59:37 +0300
Message-ID: <20200421235943.13627-1-digetx@gmail.com>
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

v6: - Corrected PMIC's RTC alias in the DTs. Sometime ago I renamed the
      PMIC's node to match the modern upstream styling, but forgot to change
      the RTC alias. Now PMIC RTC alias uses node's handle instead of string.

    - Removed "panel: " handle from device trees, which became unused after
      v5 and I just missed to remove it.

v5: - After spending some more time on adding LVDS encoder bridge support
      to the Tegra DRM driver, I'm now having a second thought and agree
      with Thierry Reding that in a longer run it should be better not to
      mix old nvidia,panel with new output graph in device-tree. So the
      nvidia,panel phandle is removed now in both A500 and Nexus 7 DTs.

v4: - Corrected CPU's thermal zone on both A500 and Nexus 7, which
      should use the remote thermal sensor (Tegra chip) instead of the
      local ("skin" temperature).

    - Added default PMIC pinmux state on Nexus 7, for completeness.

    - Added PMIC cpu_pwr_req GPIO hog on Nexus 7, for completeness.

    - Renamed thermal sensor node label to NCT72 on Nexus 7 to match the
      actual hardware (NCT72 is compatible with NCT1008). For completeness.

    - Added always-on USB AVDD regulator on Nexus 7, which is controlled by
      the PMIC GPIO. For completeness.

    - Added PMIC GPIO enable-control to the 3v3_sys regulator on Nexus 7,
      for completeness.

    - Added CONFIG_NAMESPACES, CONFIG_USER_NS, CONFIG_SECCOMP and
      CONFIG_PINCTRL_MAX77620 to the tegra_defconfig. The first three
      options are must-have for the modern userspace, the last is somewhat
      actual now since the default PMIC pinmux state is added to the N7 DT.

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
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 1457 +++++++++
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 2679 +++++++++++++++++
 .../boot/dts/tegra30-asus-nexus7-grouper.dts  |  463 +++
 .../boot/dts/tegra30-asus-nexus7-tilapia.dts  |  549 ++++
 arch/arm/configs/tegra_defconfig              |   42 +
 8 files changed, 5205 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dts

-- 
2.26.0
