From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 10/10] arm/tegra: add support for tegra30 based board cardhu
Date: Fri, 11 Nov 2011 13:22:16 +0200
Message-ID: <1321010541-31337-11-git-send-email-pdeschrijver@nvidia.com>
References: <1321010541-31337-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321010541-31337-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add support for the tegra30 based cardhu development board. Cardhu is a tablet
formfactor reference design for tegra30. The patch provides a device tree for
the board, updates Makefile.boot to build the dtb, includes the platform in
Kconfig and updates board-dt.c.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-cardhu.dts |   36 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-tegra/Kconfig        |    7 +++++++
 arch/arm/mach-tegra/Makefile.boot  |    1 +
 arch/arm/mach-tegra/board-dt.c     |    1 +
 4 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-cardhu.dts

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
new file mode 100644
index 0000000..70c41fc
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -0,0 +1,36 @@
+/dts-v1/;
+
+/include/ "tegra30.dtsi"
+
+/ {
+	model = "NVIDIA Tegra30 Cardhu evaluation board";
+	compatible = "nvidia,cardhu", "nvidia,tegra30";
+
+	memory {
+		reg = < 0x80000000 0x40000000 >;
+	};
+
+	serial@70006000 {
+		clock-frequency = < 408000000 >;
+	};
+
+	i2c@7000c000 {
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c400 {
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000c700 {
+		clock-frequency = <100000>;
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <100000>;
+	};
+};
diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index aad54ca..6bae1bb 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -91,6 +91,13 @@ config MACH_VENTANA
        help
          Support for the nVidia Ventana development platform
 
+config MACH_CARDHU
+       bool "Cardhu board"
+       depends on ARCH_TEGRA_3x_SOC
+       select MACH_TEGRA_DT
+       help
+         Support for the NVIDIA Cardhu development platform
+
 choice
         prompt "Low-level debug console UART"
         default TEGRA_DEBUG_UART_NONE
diff --git a/arch/arm/mach-tegra/Makefile.boot b/arch/arm/mach-tegra/Makefile.boot
index bd12c9f..b518848 100644
--- a/arch/arm/mach-tegra/Makefile.boot
+++ b/arch/arm/mach-tegra/Makefile.boot
@@ -5,3 +5,4 @@ initrd_phys-$(CONFIG_ARCH_TEGRA_2x_SOC)	:= 0x00800000
 dtb-$(CONFIG_MACH_HARMONY) += tegra-harmony.dtb
 dtb-$(CONFIG_MACH_SEABOARD) += tegra-seaboard.dtb
 dtb-$(CONFIG_MACH_VENTANA) += tegra-ventana.dtb
+dtb-$(CONFIG_MACH_CARDHU) += tegra-cardhu.dtb
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 486b473..7f3b235 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -146,6 +146,7 @@ static const char * tegra_dt_board_compat[] = {
 	"nvidia,harmony",
 	"nvidia,seaboard",
 	"nvidia,ventana",
+	"nvidia,cardhu",
 	NULL
 };
 
-- 
1.7.7.rc0.72.g4b5ea.dirty
