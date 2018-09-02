From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 22/37] ARM: tegra: colibri_t20: annotate/rename lm95245 temperature sensor
Date: Sun,  2 Sep 2018 12:08:51 +0200
Message-ID: <20180902100906.25792-23-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Rename and annotate LM95245 temperature sensor more in-line with our
other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 86bfe77d9230..477d67ff74c6 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -584,7 +584,8 @@
 			};
 		};
 
-		temperature-sensor@4c {
+		/* LM95245 temperature sensor */
+		temp-sensor@4c {
 			compatible = "national,lm95245";
 			reg = <0x4c>;
 		};
-- 
2.14.4
