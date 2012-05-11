From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 4/4] ARM: dt: tegra: cardhu: register core regulator tps62360
Date: Fri, 11 May 2012 12:08:45 +0530
Message-ID: <1336718325-8372-5-git-send-email-ldewangan@nvidia.com>
References: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336718325-8372-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux@arm.linux.org.uk, lrg@ti.com, broonie@opensource.wolfsonmicro.com, swarren@nvidia.com, olof@lixom.net
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add device info for the core regulator tps62360 in tegra-cardhu
dts file.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
No changes from V1 and V2.

 arch/arm/boot/dts/tegra-cardhu.dts |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
index facb950..19b6e93 100644
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -123,6 +123,20 @@
 			micdet-delay = <100>;
 			gpio-cfg = <0xffffffff 0xffffffff 0 0xffffffff 0xffffffff>;
 		};
+
+		tps62360 {
+			compatible = "ti,tps62361";
+			reg = <0x60>;
+
+			regulator-name = "tps62361-vout";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-boot-on;
+			regulator-always-on;
+			ti,vsel0-state-high;
+			ti,vsel1-state-high;
+		};
+
 	};
 
 	sdhci@78000000 {
-- 
1.7.1.1
