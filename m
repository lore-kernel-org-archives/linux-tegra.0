From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 00/12] Add some functionalities for Tegra soctherm
Date: Tue, 18 Dec 2018 15:34:31 +0800
Message-ID: <1545118484-23641-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Move the hw/sw shutdown patches into this serial. There already have
some discussion for it in https://lkml.org/lkml/2018/12/7/225.
Support GPU HW throttle, thermal IRQ, set_trips(), EDP IRQ and OC
hw throttle.

Wei Ni (12):
  of: Add bindings of thermtrip for Tegra soctherm
  thermal: tegra: support hw and sw shutdown
  arm64: dts: tegra210: set thermtrip
  of: Add bindings of gpu hw throttle for Tegra soctherm
  thermal: tegra: add support for gpu hw-throttle
  arm64: dts: tegra210: set gpu hw throttle level
  thermal: tegra: add support for thermal IRQ
  thermal: tegra: add set_trips functionality
  thermal: tegra: add support for EDP IRQ
  arm64: dts: tegra210: set EDP interrupt line
  of: Add bindings of OC hw throttle for Tegra soctherm
  thermal: tegra: enable OC hw throttle

 .../bindings/thermal/nvidia,tegra124-soctherm.txt  |  63 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  20 +-
 drivers/thermal/tegra/soctherm.c                   | 955 +++++++++++++++++++--
 drivers/thermal/tegra/soctherm.h                   |  16 +
 drivers/thermal/tegra/tegra124-soctherm.c          |   7 +-
 drivers/thermal/tegra/tegra132-soctherm.c          |   7 +-
 drivers/thermal/tegra/tegra210-soctherm.c          |  15 +-
 include/dt-bindings/thermal/tegra124-soctherm.h    |  22 +-
 8 files changed, 1029 insertions(+), 76 deletions(-)

-- 
2.7.4
