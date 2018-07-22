From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 27/28] ARM: tegra: apalis_t30: fix pcie switch vendor compatible
Date: Sun, 22 Jul 2018 18:49:35 +0200
Message-ID: <20180722164936.20581-28-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
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

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 83949ac3cc07..2c4fee53425e 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -88,7 +88,7 @@
 		clock-frequency = <400000>;
 
 		pcie-switch@58 {
-			compatible = "plx,pex8605";
+			compatible = "brcm,pex8605";
 			reg = <0x58>;
 		};
 
-- 
2.14.4
