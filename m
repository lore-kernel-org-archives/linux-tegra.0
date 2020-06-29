From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7 devices
Date: Mon, 29 Jun 2020 05:54:50 +0300
Message-ID: <20200629025456.28124-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Pedro=20=C3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series introduces upstream kernel support for Acer Iconia Tab A500
and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
in advance.

Changelog:

v10:- Rebased on a recent linux-next which got some device-tree changes:

        - Renamed sdhci@ DT nodes to mmc@
        - Removed simple-busses from DTs
        - Checked DTBs using upcoming YAML bindings from Thierry Reding

v9: - Nexus 7 memory timings are moved out to a separate dtsi file to ease
      reviewing of the device-trees since the sparse definition of the timings
      within multiple DT files created some unnecessary confusion.
      Thanks to Michał Mirosław for the suggestion.

v8: - The eMMC voltage regulator is now marked as always-ON in all
      device-trees because turned out that some bootloader versions have
      assumption about the enabled regulator at a boot time. This fixes
      machine hanging on a warm reboot, it's also matching the downstream
      kernel regulator configuration.

    - The core regulator of the Ti PMIC Nexus 7 variant is now limited
      to a 1.35V, which is a more realistic limit than 1.5V that was borrowed
      from the Cardhu device-tree. Now both Maxim and Ti variants have the
      common limits.

    - Added acks from Rob Herring.

v7: - This version brings support for a Nexus 7 variant that uses Ti PMIC
      instead of the Maxim PMIC. Previously we assumed that variant with
      the Ti PMIC doesn't exist in a wild, but turned out that it was a
      wrong assumption. In a result the device-trees are separated into
      more DTSI pieces, which combined together form the final device-tree.
      Thanks to Zack Pearsall for testing the Ti version!

    - The camera voltage regulator is now preset to a correct 1.8v in the
      Nexus 7 device-tree.

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
 arch/arm/boot/dts/Makefile                    |    4 +
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 1438 +++++++++++++++
 .../dts/tegra30-asus-nexus7-grouper-E1565.dts |    9 +
 .../dts/tegra30-asus-nexus7-grouper-PM269.dts |    9 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 1232 +++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  185 ++
 ...30-asus-nexus7-grouper-memory-timings.dtsi | 1565 +++++++++++++++++
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  149 ++
 .../boot/dts/tegra30-asus-nexus7-grouper.dtsi |  149 ++
 .../dts/tegra30-asus-nexus7-tilapia-E1565.dts |    9 +
 ...30-asus-nexus7-tilapia-memory-timings.dtsi |  325 ++++
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  235 +++
 arch/arm/configs/tegra_defconfig              |   42 +
 15 files changed, 5363 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi

-- 
2.26.0
