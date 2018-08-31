From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 27/34] ARM: tegra: apalis_t30: drop module level model and compatible
Date: Fri, 31 Aug 2018 18:38:09 +0200
Message-ID: <20180831163817.23970-28-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop model and compatible nodes from the module level device tree as
they get overridden by the carrier board device tree anyway.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch as suggested by Rob.

 arch/arm/boot/dts/tegra30-apalis.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index d80101df2228..e7793f3b19d2 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -7,9 +7,6 @@
  * 2GB: V1.0B, V1.0C, V1.0E, V1.1A
  */
 / {
-	model = "Toradex Apalis T30";
-	compatible = "toradex,apalis_t30", "nvidia,tegra30";
-
 	memory@80000000 {
 		reg = <0x80000000 0x40000000>;
 	};
-- 
2.14.4
