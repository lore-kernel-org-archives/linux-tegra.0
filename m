From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/3] arm/tegra: Add device-tree support for TrimSlice board
Date: Tue, 25 Oct 2011 14:01:28 +0200
Message-ID: <1319544088-25946-3-git-send-email-swarren@nvidia.com>
References: <1319544088-25946-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1319544088-25946-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Add device-tree file for TrimSlice
* Add that to the list of .dts files to build
* Update board-dt.c to recognize TrimSlice board name

v2: Makefile: Add board-trimslice-pinmux.c to obj-$(CONFIG_MACH_TEGRA_DT).
v3: Makefile: Use brackets not braces around var names

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-trimslice.dts |   38 +++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile          |    1 +
 arch/arm/mach-tegra/Makefile.boot     |    1 +
 arch/arm/mach-tegra/board-dt.c        |    3 ++
 4 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-trimslice.dts

diff --git a/arch/arm/boot/dts/tegra-trimslice.dts b/arch/arm/boot/dts/tegra-trimslice.dts
new file mode 100644
index 0000000..d3d0d20
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-trimslice.dts
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+/memreserve/ 0x1c000000 0x04000000;
+/include/ "tegra20.dtsi"
+
+/ {
+	model = "Compulab TrimSlice board";
+	compatible = "compulab,trimslice", "nvidia,tegra20";
+
+	chosen {
+		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk0p1 rw rootwait";
+	};
+
+	memory@0 {
+		reg = < 0x00000000 0x40000000 >;
+	};
+
+	i2c@7000c000 {
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000c400 {
+		clock-frequency = <400000>;
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <400000>;
+	};
+
+	serial@70006000 {
+		clock-frequency = < 216000000 >;
+	};
+
+	sdhci@c8000600 {
+		cd-gpios = <&gpio 121 0>;
+		wp-gpios = <&gpio 122 0>;
+	};
+};
diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 91a07e1..3034d84 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -32,6 +32,7 @@ obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
 obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
 obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
 obj-${CONFIG_MACH_TEGRA_DT}             += board-seaboard-pinmux.o
+obj-$(CONFIG_MACH_TEGRA_DT)             += board-trimslice-pinmux.o
 
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice.o
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice-pinmux.o
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index bd12c9f..9f177a4 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -4,4 +4,5 @@ initrd_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00800000
 
 dtb-$(CONFIG_MACH_HARMONY) += tegra-harmony.dtb
 dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
+dtb-$(CONFIG_MACH_TRIMSLICE) += tegra-trimslice.dtb
 dtb-$(CONFIG_MACH_VENTANA) += tegra-ventana.dtb
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 74743ad..79817b6 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -47,6 +47,7 @@
 
 void harmony_pinmux_init(void);
 void seaboard_pinmux_init(void);
+void trimslice_pinmux_init(void);
 void ventana_pinmux_init(void);
 
 struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
@@ -84,6 +85,7 @@ static struct {
 	char *machine;
 	void (*init)(void);
 } pinmux_configs[] = {
+	{ "compulab,trimslice", trimslice_pinmux_init },
 	{ "nvidia,harmony", harmony_pinmux_init },
 	{ "nvidia,seaboard", seaboard_pinmux_init },
 	{ "nvidia,ventana", ventana_pinmux_init },
@@ -120,6 +122,7 @@ static void __init tegra_dt_init(void)
 }
 
 static const char * tegra_dt_board_compat[] = {
+	"compulab,trimslice",
 	"nvidia,harmony",
 	"nvidia,seaboard",
 	"nvidia,ventana",
-- 
1.7.4.1
