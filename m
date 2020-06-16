From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 45/73] arm64: tegra: Add interrupt-names for host1x
Date: Tue, 16 Jun 2020 15:52:10 +0200
Message-ID: <20200616135238.3001888-46-thierry.reding@gmail.com>
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

Interrupt names are used to distinguish between the syncpoint and
general host1x interrupts. Make sure they are available in the DT so
that drivers can use them if necessary.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 6ebfe503489f..76e1a6451e83 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -89,6 +89,7 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&tegra_car 28>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index decf8de3bbe5..e86b682f8645 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -940,6 +940,7 @@ host1x@13e00000 {
 		reg-names = "hypervisor", "vm";
 		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
 		             <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&bpmp TEGRA186_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&bpmp TEGRA186_RESET_HOST1X>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 73aba724bf67..f056158a2634 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1042,6 +1042,7 @@ host1x@13e00000 {
 			reg-names = "hypervisor", "vm";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "syncpt", "host1x";
 			clocks = <&bpmp TEGRA194_CLK_HOST1X>;
 			clock-names = "host1x";
 			resets = <&bpmp TEGRA194_RESET_HOST1X>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index cbf0d30a2f8b..0586722df64b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -90,6 +90,7 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA210_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&tegra_car 28>;
-- 
2.24.1
