From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 13/15] ARM: tegra: apalis-tk1: fix pcie switch vendor compatible
Date: Tue, 24 Jul 2018 12:43:07 +0200
Message-ID: <20180724104309.21741-14-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

PLX got bought by Broadcom therefore fix device tree compatible string
vendor which silences the following checkpatch.pl warning:

WARNING: DT compatible string vendor "plx" appears un-documented
 -- check ./Documentation/devicetree/bindings/vendor-prefixes.txt

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index d9805fc97f5e..84ab7dc9febb 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -109,7 +109,7 @@
 		clock-frequency = <400000>;
 
 		pcie-switch@58 {
-			compatible = "plx,pex8605";
+			compatible = "brcm,pex8605";
 			reg = <0x58>;
 		};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 89783fe76f65..5319f88d3cab 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -74,7 +74,7 @@
 		clock-frequency = <400000>;
 
 		pcie-switch@58 {
-			compatible = "plx,pex8605";
+			compatible = "brcm,pex8605";
 			reg = <0x58>;
 		};
 
-- 
2.14.4
