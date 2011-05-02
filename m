From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: Tegra: Seaboard: Add devicetree support
Date: Mon,  2 May 2011 12:50:31 -0600
Message-ID: <1304362231-21909-3-git-send-email-swarren@nvidia.com>
References: <1304362231-21909-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1304362231-21909-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Rebased on latest devicetree/test, s/Harmony/Seaboard in model,
    s/rootdelay/rootwait/.

Patch series tested on Harmony, Seaboard (non-clamshell and clamshell)

 arch/arm/boot/dts/tegra-seaboard.dts |   34 ++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile.boot    |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-seaboard.dts

diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dts/tegra-seaboard.dts
new file mode 100644
index 0000000..abcc7d7
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-seaboard.dts
@@ -0,0 +1,34 @@
+/dts-v1/;
+
+/memreserve/ 0x1c000000 0x04000000;
+/include/ "tegra250.dts"
+
+/ {
+	model = "NVIDIA Seaboard";
+	compatible = "nvidia,seaboard", "nvidia,tegra250";
+
+	chosen {
+		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = < 0x00000000 0x40000000 >;
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
1.7.0.4
