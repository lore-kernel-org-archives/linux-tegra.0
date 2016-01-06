From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM64: tegra: Add support for Google Pixel C
Date: Wed, 6 Jan 2016 09:40:22 +0000
Message-ID: <1452073222-2956-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add initial device-tree support for Google Pixel C (a.k.a. Smaug) based
upon Tegra210 SoC with 3 GiB of LPDDR4 RAM.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/Makefile           |  1 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 42 +++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index a7e865da1005..0f7cdf3e05c1 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra132-norrin.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2371-2180.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2571.dtb
+dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
 
 always		:= $(dtb-y)
 clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
new file mode 100644
index 000000000000..a7474f5fcbcc
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -0,0 +1,42 @@
+/dts-v1/;
+
+#include "tegra210.dtsi"
+
+/ {
+	model = "Google Pixel C";
+	compatible = "google,smaug-rev8", "google,smaug-rev7",
+		     "google,smaug-rev6", "google,smaug-rev5",
+		     "google,smaug-rev4", "google,smaug-rev3",
+		     "google,smaug-rev1", "google,smaug", "nvidia,tegra210";
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x70006000";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0xc0000000>;
+	};
+
+	serial@0,70006000 {
+		status = "okay";
+	};
+
+	pmc@0,7000e400 {
+		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <0>;
+		nvidia,cpu-pwr-good-time = <0>;
+		nvidia,cpu-pwr-off-time = <0>;
+		nvidia,core-pwr-good-time = <12000 6000>;
+		nvidia,core-pwr-off-time = <39053>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
+		status = "okay";
+	};
+
+	sdhci@0,700b0600 {
+		bus-width = <8>;
+		non-removable;
+		status = "okay";
+	};
+};
-- 
2.1.4
