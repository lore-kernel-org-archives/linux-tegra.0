From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v2 0/2] Device tree changes for Tegra30 and Tegra114 USB Host support
Date: Thu, 1 Aug 2013 18:00:16 +0300
Message-ID: <1375369218-11288-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi all,

Here's the device tree changes required for USB Host support on Tegra30 and
Tegra114. This enables USB Host on the Cardhu's dock connector port and on the
single built-in A-ports on Dalmore and Beaver.

Diff from v1:
 - Use internal pullups on the VBUS regulator GPIOs on Beaver.

Mikko Perttunen (1):
  ARM: dts: USB for Tegra114 Dalmore

Tuomas Tynkkynen (1):
  ARM: DTS: tegra: Add USB entries for Tegra30

 arch/arm/boot/dts/tegra114-dalmore.dts |  9 ++++
 arch/arm/boot/dts/tegra114.dtsi        | 62 ++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30-beaver.dts   | 22 ++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi  |  9 ++++
 arch/arm/boot/dts/tegra30.dtsi         | 86 ++++++++++++++++++++++++++++++++++
 5 files changed, 186 insertions(+), 2 deletions(-)

-- 
1.8.1.5
