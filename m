From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 63/73] arm64: tegra: Remove XUSB pad controller interrupt from XUSB node
Date: Tue, 16 Jun 2020 15:52:28 +0200
Message-ID: <20200616135238.3001888-64-thierry.reding@gmail.com>
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

The XUSB controller doesn't need the XUSB pad controller's interrupt, so
remove it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 3 +--
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b4150d8cccf5..1cd369ac48d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -568,8 +568,7 @@ usb@3530000 {
 		      <0x0 0x03538000 0x0 0x1000>;
 		reg-names = "hcd", "fpci";
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
 			 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
 			 <&bpmp TEGRA186_CLK_XUSB_SS>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index bf696ada856c..4d6f2127dd4a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -688,8 +688,7 @@ usb@3610000 {
 			reg-names = "hcd", "fpci";
 
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
 				 <&bpmp TEGRA194_CLK_XUSB_FALCON>,
-- 
2.24.1
