From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: Tegra: Seaboard: Add devicetree support
Date: Fri, 29 Apr 2011 22:12:31 -0600
Message-ID: <1304136751-11629-2-git-send-email-swarren@nvidia.com>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304136751-11629-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-seaboard.dts |   33 +++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot    |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-seaboard.dts

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
new file mode 100644
index 0000000..d5c9ad7
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -0,0 +1,33 @@
+/dts-v1/;
+/include/ "tegra250.dts"
+
+/ {
+	model = "NVIDIA Harmony";
+	compatible = "nvidia,seaboard", "nvidia,tegra250";
+
+	chosen {
+		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootdelay=2";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = < 0x00000000 0x1C000000
+		        0x20000000 0x20000000 >;
+	};
+
+	serial@70006300 {
+		status = "ok";
+		clock-frequency = < 216000000 >;
+	};
+
+	sdhci@c8000400 {
+		status = "ok";
+		gpios = <&gpio 69 0>, /* cd, gpio PI5 */
+			<&gpio 57 0>, /* wp, gpio PH1 */
+			<&gpio 70 0>; /* power, gpio PI6 */
+	};
+
+	sdhci@c8000600 {
+		status = "ok";
+	};
+};
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index c98addf..428ad12 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -3,3 +3,4 @@ params_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00000100
 initrd_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00800000
 
 dtb-$(CONFIG_MACH_HARMONY) += tegra-harmony.dtb
+dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
-- 
1.7.1
