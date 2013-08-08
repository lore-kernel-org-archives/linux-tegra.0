From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v2 0/3] Add power control for lm90
Date: Thu, 8 Aug 2013 14:56:28 +0800
Message-ID: <1375944991-29182-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khali@linux-fr.org, linux@roeck-us.net, swarren@wwwdotorg.org
Cc: MLongnecker@nvidia.com, linux-arm-kernel@lists.infradead.org, lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The device lm90 can be controlled by the vdd rail.
Add function to power on/off the vdd.
Enable the nct1008 on Tegra114 Dalmore board, and set the vdd-regulator.

This series is v2, previous version patches:
[v1]: http://www.mail-archive.com/linux-tegra@vger.kernel.org/msg12034.html

Changes from v1:
1. if get regulator failed, we should continue to run probe function,
not return fail.
2. call regulator_put() in error handler and remove function.
3. add LM90 DT binding document.

Wei Ni (3):
  hwmon: (lm90) Add power control
  ARM: dt: t114 dalmore: add dt entry for nct1008
  Documentation: dt: hwmon: add OF document for lm90

 Documentation/devicetree/bindings/hwmon/lm90.txt |   20 +++++++++
 arch/arm/boot/dts/tegra114-dalmore.dts           |   10 ++++-
 drivers/hwmon/lm90.c                             |   49 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lm90.txt

-- 
1.7.9.5
