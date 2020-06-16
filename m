From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 31/73] ARM: tegra: Add parent clock to DSI output
Date: Tue, 16 Jun 2020 15:51:56 +0200
Message-ID: <20200616135238.3001888-32-thierry.reding@gmail.com>
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

The DSI output needs to specify a parent clock that will be used to
drive both the output and the display controller.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 +++-
 arch/arm/boot/dts/tegra30.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2568236284ad..19d5d4b8692b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -154,7 +154,9 @@ tvo@542c0000 {
 		dsi@54300000 {
 			compatible = "nvidia,tegra20-dsi";
 			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_DSI>;
+			clocks = <&tegra_car TEGRA20_CLK_DSI>,
+				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 690e1628860f..d80f9d3d2d18 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -255,7 +255,9 @@ tvo@542c0000 {
 		dsi@54300000 {
 			compatible = "nvidia,tegra30-dsi";
 			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA30_CLK_DSIA>;
+			clocks = <&tegra_car TEGRA30_CLK_DSIA>,
+				 <&tegra_car TEGRA30_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
-- 
2.24.1
