From: Vidya Sagar <vidyas@nvidia.com>
Subject: [PATCH v1] ARM: tegra: Fix sd4 regulator in Jetson TK1 device tree
Date: Mon, 22 Sep 2014 23:27:55 +0530
Message-ID: <1411408675-32315-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
Cc: kthota@nvidia.com, linux-tegra@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

sd4 is an always on regulator which is turned on at boot time.
It is externally controller through gpio. This change
reflects the same in Jetson TK1 device tree

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 029c9a02..5c2201a 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1550,6 +1550,9 @@
 					regulator-name = "+1.05V_RUN";
 					regulator-min-microvolt = <1050000>;
 					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+					regulator-boot-on;
+					ams,ext-control = <1>;
 				};
 
 				vddio_1v8: sd5 {
-- 
1.8.1.5
