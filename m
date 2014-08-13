From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 4/5] ARM: tegra: Add PMC thermtrip programming to Jetson TK1 device tree
Date: Wed, 13 Aug 2014 15:41:24 +0300
Message-ID: <1407933685-12404-5-git-send-email-mperttunen@nvidia.com>
References: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407933685-12404-1-git-send-email-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, wni@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This adds the required information to reset the board during an overheating
situation to the Jetson TK1 device tree. The thermal reset is handled by the
PMC by sending an I2C message to the PMIC. The entries specify the I2C
message to be sent.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 624b0fb..9ff69ad 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1617,6 +1617,12 @@
 		nvidia,core-pwr-off-time = <61036>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+
+		i2c-thermtrip {
+			nvidia,pmu = <&pmic>;
+			nvidia,reg-addr = <0x36>;
+			nvidia,reg-data = <0x2>;
+		};
 	};
 
 	padctl@0,7009f000 {
-- 
1.8.1.5
