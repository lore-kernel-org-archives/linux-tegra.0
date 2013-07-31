From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH 0/2] Device tree changes for Tegra30 and Tegra114 USB Host support
Date: Wed, 31 Jul 2013 20:42:21 +0300
Message-ID: <1375292543-7896-1-git-send-email-ttynkkynen@nvidia.com>
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
single built-in A-ports on Dalmore and Beaver,

Mikko Perttunen (1):
  ARM: dts: USB for Tegra114 Dalmore

Tuomas Tynkkynen (1):
  ARM: DTS: tegra: Add USB entries for Tegra30

 arch/arm/boot/dts/tegra114-dalmore.dts |  9 ++++
 arch/arm/boot/dts/tegra114.dtsi        | 62 ++++++++++++++++++++++++
 arch/arm/boot/dts/tegra30-beaver.dts   | 23 ++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi  |  9 ++++
 arch/arm/boot/dts/tegra30.dtsi         | 86 ++++++++++++++++++++++++++++++++++
 5 files changed, 187 insertions(+), 2 deletions(-)

-- 
1.8.1.5
