From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 00/37] ARM: dts: tegra: colibri_t20: major revamp incl. eval board support
Date: Sun,  2 Sep 2018 12:08:29 +0200
Message-ID: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

This series is a major overhaul and adds support for the Colibri
Evaluation Board device tree.

Changes in v2:
- Fix commit message which was mixed up between "[PATCH 03/31] ARM:
  tegra: colibri_t20: iris: annotate i2c busses" and "[PATCH 04/31] ARM:
  tegra: colibri_t20: iris: add missing aliases".
- Also replace underscores in node names with dashes.
- Also reflect this change in the Iris device tree.
- Also reflect this change in the device tree bindings documentation.
- New patch as suggested by Rob.
- New patch.
- Get rid of fake clocks simple bus as suggested by Rob.
- Updated evaluation board device tree with all applicable previous
  fixes.
- Also reflect this addition in the device tree bindings documentation.

Marcel Ziswiler (37):
  ARM: tegra: colibri_t20: move aliases from module to carrier board
  ARM: tegra: colibri_t20: iris: integrate i2c real time clock support
  ARM: tegra: colibri_t20: iris: add missing aliases
  ARM: tegra: colibri_t20: iris: annotate i2c busses
  ARM: tegra: colibri_t20: add local-mac-address property
  ARM: tegra: colibri_t20: reorder host1x/hdmi properties
  ARM: tegra: colibri_t20: iris: use no-1-8-v
  ARM: tegra: colibri_t20: regulator clean-up
  ARM: tegra: colibri_t20: add missing regulators
  ARM: tegra: colibri_t20: annotate usb ehci instances
  ARM: tegra: colibri_t20: remove phy-reset-gpio from controller node
  ARM: tegra: colibri_t20: indentation/line-feed/white-space clean-up
  ARM: tegra: colibri_t20: update sound nvidia,model
  ARM: tegra: colibri_t20: pinmux clean-up
  ARM: tegra: colibri_t20: add missing pinmux
  ARM: tegra: colibri_t20: iris: display controller rgb panel support
  ARM: tegra: colibri_t20: iris: annotate uarts
  ARM: tegra: colibri_t20: iris: add uart-c
  ARM: tegra: colibri_t20: use high speed uart driver
  ARM: tegra: colibri_t20: iris: add gpio wakeup key
  ARM: tegra: colibri_t20: iris: add dr_mode property
  ARM: tegra: colibri_t20: annotate/rename lm95245 temperature sensor
  ARM: tegra: colibri_t20: add i2c-thermtrip
  ARM: tegra: colibri_t20: add gpio hog to unreset usb ethernet chip
  ARM: tegra: colibri_t20: add gpio hogs for gmi_wr_n buffers
  ARM: tegra: colibri_t20: annotate/move sd card detect
  ARM: tegra: colibri_t20: add compatibility comment
  ARM: tegra: colibri_t20: simplify model and compatible properties
  ARM: tegra: colibri_t20: iris: simplify model and compatible
    properties
  ARM: tegra: colibri_t20: iris: add colibri ssp support
  ARM: tegra: colibri_t20: drop module level model and compatible
  ARM: tegra: colibri_t20: rename i2c_ddc to hdmi_ddc
  ARM: tegra: colibri_t20: iris: drop unused i2c_ddc label
  ARM: tegra: colibri_t20: rename tps6586x@34 and drop unused pmic label
  ARM: tegra: colibri_t20: get rid of fake clocks simple bus
  ARM: tegra: colibri_t20: rename ac97 label to tegra_ac97
  ARM: tegra: colibri_t20: add eval board device tree

 Documentation/devicetree/bindings/arm/tegra.txt |   5 +-
 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts   | 262 ++++++++++
 arch/arm/boot/dts/tegra20-colibri-iris.dts      | 200 ++++++--
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 655 ++++++++++++++++--------
 5 files changed, 866 insertions(+), 257 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts

-- 
2.14.4
