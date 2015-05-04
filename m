From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Use lower-case hexadecimal digits
Date: Mon,  4 May 2015 13:24:41 +0200
Message-ID: <1430738682-24665-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

For consistency with other device tree content, use lower-case
hexadecimal digits in register region specifications.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt | 2 +-
 arch/arm/boot/dts/tegra124.dtsi                                | 2 +-
 arch/arm/boot/dts/tegra20.dtsi                                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index 23e1d3194174..41372d441131 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -29,7 +29,7 @@ Example:
 
 	fuse@7000f800 {
 		compatible = "nvidia,tegra20-efuse";
-		reg = <0x7000F800 0x400>,
+		reg = <0x7000f800 0x400>,
 		      <0x70000000 0x400>;
 		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
 		clock-names = "fuse";
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index d1a1e93543fa..e137a48678ea 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -303,7 +303,7 @@
 	apbmisc@0,70000800 {
 		compatible = "nvidia,tegra124-apbmisc", "nvidia,tegra20-apbmisc";
 		reg = <0x0 0x70000800 0x0 0x64>,   /* Chip revision */
-		      <0x0 0x7000E864 0x0 0x04>;   /* Strapping options */
+		      <0x0 0x7000e864 0x0 0x04>;   /* Strapping options */
 	};
 
 	pinmux: pinmux@0,70000868 {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 814d8d62fe17..d2a97bd7a4d4 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -591,7 +591,7 @@
 
 	fuse@7000f800 {
 		compatible = "nvidia,tegra20-efuse";
-		reg = <0x7000F800 0x400>;
+		reg = <0x7000f800 0x400>;
 		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
 		clock-names = "fuse";
 		resets = <&tegra_car 39>;
-- 
2.3.5
