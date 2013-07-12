From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v3 0/2] Enable lm90 in Tegra30 and Tegra114.
Date: Fri, 12 Jul 2013 15:49:22 +0800
Message-ID: <1373615364-18559-1-git-send-email-wni@nvidia.com>
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
[v2]: http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg465561.html

Changes from v2:
1. remove the label "nct1008".

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
