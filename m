From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 14/19] ARM: tegra: apalis-tk1: drop module level model and compatible
Date: Sat,  1 Sep 2018 15:04:59 +0200
Message-ID: <20180901130504.14318-15-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 4 ----
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 07dd208296d3..e70994518c70 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -11,10 +11,6 @@
  * Compatible for Revisions 2GB: V1.2A
  */
 / {
-	model = "Toradex Apalis TK1";
-	compatible = "toradex,apalis-tk1-v1.2", "toradex,apalis-tk1",
-		     "nvidia,tegra124";
-
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index fe10c5180768..b1a05c37106d 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -47,9 +47,6 @@
  * Compatible for Revisions 2GB: V1.0A, V1.0B, V1.1A
  */
 / {
-	model = "Toradex Apalis TK1";
-	compatible = "toradex,apalis-tk1", "nvidia,tegra124";
-
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.14.4
