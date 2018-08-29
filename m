From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 00/31] ARM: dts: tegra: colibri_t20: major revamp incl. eval board support
Date: Wed, 29 Aug 2018 10:13:36 +0200
Message-ID: <20180829081407.11304-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel@ziswiler.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org


This series is a major overhaul and adds support for the Colibri
Evaluation Board device tree.


Marcel Ziswiler (31):
  ARM: tegra: colibri_t20: move aliases from module to carrier board
  ARM: tegra: colibri_t20: iris: integrate i2c real time clock support
  ARM: tegra: colibri_t20: iris: annotate i2c busses
  ARM: tegra: colibri_t20: iris: add missing aliases
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
  ARM: tegra: colibri_t20: add evaluation board device tree

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts | 266 +++++++++++
 arch/arm/boot/dts/tegra20-colibri-iris.dts    | 198 ++++++--
 arch/arm/boot/dts/tegra20-colibri.dtsi        | 629 +++++++++++++++++---------
 4 files changed, 858 insertions(+), 236 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts

-- 
2.14.4
