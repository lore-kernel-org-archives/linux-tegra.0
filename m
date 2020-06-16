From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/73] ARM: tegra: The Tegra114 DC is not backwards-compatible
Date: Tue, 16 Jun 2020 15:51:36 +0200
Message-ID: <20200616135238.3001888-12-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The display controller on Tegra114 is in fact not backwards-compatible
with the instantiation found on earlier SoCs. Drop the misleading
compatible string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 392f06107b32..a06b88b01ef3 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -56,7 +56,7 @@ gr3d@54180000 {
 		};
 
 		dc@54200000 {
-			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			compatible = "nvidia,tegra114-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
@@ -75,7 +75,7 @@ rgb {
 		};
 
 		dc@54240000 {
-			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			compatible = "nvidia,tegra114-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
-- 
2.24.1
