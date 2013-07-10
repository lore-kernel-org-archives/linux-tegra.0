From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v2 0/2] Enable lm90 in Tegra30 and Tegra114.
Date: Wed, 10 Jul 2013 19:29:56 +0800
Message-ID: <1373455798-2944-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: khali@linux-fr.org, swarren@wwwdotorg.org, linux@roeck-us.net, thierry.reding@gmail.com
Cc: lm-sensors@lm-sensors.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enable thermal sensor lm90 for Tegra30 Cardhu and Tegra114 Dalmore.

This series is v2, previous version patches:
[RFC 1/9]: http://thread.gmane.org/gmane.linux.power-management.general/31056
[v1]: http://thread.gmane.org/gmane.linux.ports.tegra/11713/

Changes from v1:
1. add vendor strings "onnn" for nct1008 node.

Changes from RFC:
1. Enable it for Tegra114 Dalmore.

Wei Ni (2):
  ARM: dt: t30 cardhu: add dt entry for nct1008
  ARM: dt: t114 dalmore: add dt entry for nct1008

 arch/arm/boot/dts/tegra114-dalmore.dts |    7 +++++++
 arch/arm/boot/dts/tegra30-cardhu.dtsi  |    7 +++++++
 2 files changed, 14 insertions(+)

-- 
1.7.9.5
