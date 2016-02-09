From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3] ARM64: tegra: Add support for Google Pixel C
Date: Tue, 9 Feb 2016 12:26:49 +0000
Message-ID: <1455020809-17531-1-git-send-email-jonathanh@nvidia.com>
References: <1454949199-27050-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454949199-27050-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add initial device-tree support for Google Pixel C (a.k.a. Smaug) based
upon Tegra210 SoC with 3 GiB of LPDDR4 RAM.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Changes v2 -> v3:
- Added PSCI information to enable all 4 CPUs on boot

Changes v1 -> v2:
- Removed console boot parameter and added stdout-path
- Added 32k clock for PMC

 arch/arm64/boot/dts/nvidia/Makefile           |  1 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 83 +++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
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
index 000000000000..750e85c45135
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -0,0 +1,83 @@
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
+	aliases {
+		serial0 = &uarta;
+	};
+
+	chosen {
+		bootargs = "earlycon";
+		stdout-path = "serial0:115200n8";
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
+
+	clocks {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		clk32k_in: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	cpus {
+		cpu@0 {
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+};
-- 
2.1.4
