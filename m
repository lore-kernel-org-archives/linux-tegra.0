From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 2/3] arm/dt: tegra: add dts file for paz00
Date: Wed, 26 Oct 2011 21:59:21 +0200
Message-ID: <e528a8eb783ace4729e0c76ca72d500d5281c9af.1319658296.git.marvin24@gmx.de>
References: <cover.1319658296.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds a dts file for paz00. As a side effect, this also enables
the embedded controller which controls the keyboard, touchpad, power,
leds, and some other functions.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   70 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Makefile      |    1 +
 arch/arm/mach-tegra/Makefile.boot |    1 +
 arch/arm/mach-tegra/board-dt.c    |    3 ++
 4 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-paz00.dts

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
new file mode 100644
index 0000000..9bd471e
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -0,0 +1,70 @@
+/dts-v1/;
+
+/memreserve/ 0x1c000000 0x04000000;
+/include/ "tegra20.dtsi"
+
+/ {
+	model = "Toshiba AC100 / Dynabook AZ";
+	compatible = "compal,paz00", "nvidia,tegra20";
+
+	chosen {
+		bootargs = "mem=448@0 console=ttyS0,115200n8 root=/dev/mmcblk1p1";
+	};
+
+	memory@0 {
+		reg = <0x00000000 0x20000000>;
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
+		status = "disable";
+	};
+
+	nvec@7000c500 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,nvec";
+		reg = <0x7000C500 0x100>;
+		interrupts = <124>;
+		clock-frequency = <80000>;
+		request-gpios = <&gpio 170 0>;
+		slave-addr = <138>;
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <400000>;
+	};
+
+	serial@70006000 {
+		clock-frequency = <216000000>;
+	};
+
+	serial@70006300 {
+		clock-frequency = <216000000>;
+	};
+
+	sdhci@c8000000 {
+		cd-gpios = <&gpio 173 0>; /* gpio PV5 */
+		wp-gpios = <&gpio 57 0>;  /* gpio PH1 */
+		power-gpios = <&gpio 155 0>; /* gpio PT3 */
+	};
+
+	sdhci@c8000200 {
+		status = "disable";
+	};
+
+	sdhci@c8000400 {
+		status = "disable";
+	};
+
+	sdhci@c8000600 {
+		support-8bit;
+	};
+};
diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 91a07e1..70826a9 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -31,6 +31,7 @@ obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
 
 obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
 obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
+obj-$(CONFIG_MACH_TEGRA_DT)             += board-paz00-pinmux.o
 obj-${CONFIG_MACH_TEGRA_DT}             += board-seaboard-pinmux.o
 
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice.o
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index bd12c9f..152f9fb 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -3,5 +3,6 @@ params_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00000100
 initrd_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00800000
 
 dtb-$(CONFIG_MACH_HARMONY) += tegra-harmony.dtb
+dtb-$(CONFIG_MACH_PAZ00) += tegra-paz00.dtb
 dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
 dtb-$(CONFIG_MACH_VENTANA) += tegra-ventana.dtb
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index d368f8d..379660e 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -46,6 +46,7 @@
 #include "devices.h"
 
 void harmony_pinmux_init(void);
+void paz00_pinmux_init(void);
 void seaboard_pinmux_init(void);
 void ventana_pinmux_init(void);
 
@@ -85,6 +86,7 @@ static struct {
 	void (*init)(void);
 } pinmux_configs[] = {
 	{ "nvidia,harmony", harmony_pinmux_init },
+	{ "compal,paz00", paz00_pinmux_init },
 	{ "nvidia,seaboard", seaboard_pinmux_init },
 	{ "nvidia,ventana", ventana_pinmux_init },
 };
@@ -120,6 +122,7 @@ static void __init tegra_dt_init(void)
 
 static const char * tegra_dt_board_compat[] = {
 	"nvidia,harmony",
+	"compal,paz00",
 	"nvidia,seaboard",
 	"nvidia,ventana",
 	NULL
-- 
1.7.5.4
