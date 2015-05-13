From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] arm64: tegra: Add NVIDIA P2371 support
Date: Wed, 13 May 2015 16:57:45 +0200
Message-ID: <1431529065-20128-6-git-send-email-thierry.reding@gmail.com>
References: <1431529065-20128-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431529065-20128-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The NVIDIA P2371 is an internal reference design that uses a P2530
compute module hooked up to a a P2595 base board and an optional display
module for a 1200x1920 MIPI DSI panel.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/Makefile               |  1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-e01.dts | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p2371-e01.dts

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index f36ea6b6c6d6..0b4a06e532a8 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_TEGRA) += tegra132-norrin.dtb
+dtb-$(CONFIG_ARCH_TEGRA) += tegra210-p2371-e01.dtb
 
 always		:= $(dtb-y)
 clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-e01.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-e01.dts
new file mode 100644
index 000000000000..db8c5e369184
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-e01.dts
@@ -0,0 +1,27 @@
+/dts-v1/;
+
+#include "tegra210-p2530-e03.dtsi"
+#include "tegra210-p2595-a02.dtsi"
+
+/ {
+	model = "NVIDIA Tegra210 P2371 reference board (E.1)";
+	compatible = "nvidia,p2371-e01", "nvidia,tegra210";
+
+	host1x@0,50000000 {
+		dsi@0,54300000 {
+			status = "okay";
+
+			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
+
+			panel@0 {
+				compatible = "auo,b080uan01";
+				reg = <0>;
+
+				enable-gpios = <&gpio TEGRA_GPIO(V, 2)
+						GPIO_ACTIVE_HIGH>;
+				power-supply = <&vdd_5v0_io>;
+				backlight = <&backlight>;
+			};
+		};
+	};
+};
-- 
2.3.5
