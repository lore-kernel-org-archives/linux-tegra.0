From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 2/4] ARM: tegra: add SDHCI support for Dalmore
Date: Wed, 20 Feb 2013 13:35:15 -0500
Message-ID: <1361385317-6020-3-git-send-email-rklein@nvidia.com>
References: <1361385317-6020-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1361385317-6020-1-git-send-email-rklein@nvidia.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Chris Ball <cjb@laptop.org>, linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org
Cc: Pritesh Raithatha <praithatha@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Based on changes by: Pritesh Raithatha <praithatha@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index a30aca6..7be8bd2 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -15,6 +15,17 @@
 		clock-frequency = <408000000>;
 	};
 
+	sdhci@78000400 {
+		cd-gpios = <&gpio 170 1>; /* gpio PV2 */
+		bus-width = <4>;
+		status = "okay";
+	};
+
+	sdhci@78000600 {
+		bus-width = <8>;
+		status = "okay";
+	};
+
 	pmc {
 		nvidia,invert-interrupt;
 	};
-- 
1.7.9.5

