From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/3] arm/dt: tegra: add dts file for paz00
Date: Sat, 22 Oct 2011 22:16:34 +0200
Message-ID: <90ee88bcde84141e0280ffa4ccbd288462489eba.1319313020.git.marvin24@gmx.de>
References: <cover.1319313019.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* NOT FOR COMMIT *

This just adds the dts for paz00. I like to add it to board-dt as
well as soon as I find out which tree to base it on.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   51 +++++++++++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra-paz00.dts

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
new file mode 100644
index 0000000..2114026
--- /dev/null
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -0,0 +1,51 @@
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
+		bootargs = "console=ttyS0,115200n8 root=/dev/mmcblk1p1";
+	};
+
+	memory@0 {
+		reg = < 0x00000000 0x20000000 >;
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
+		clock-frequency = <80000>;
+	};
+
+	i2c@7000d000 {
+		clock-frequency = <400000>;
+	};
+
+	serial@70006000 {
+		clock-frequency = < 216000000 >;
+	};
+
+	serial@70006300 {
+		clock-frequency = < 216000000 >;
+	};
+
+	sdhci@c8000000 {
+		cd-gpios = <&gpio 173 0>; /* gpio PV5 */
+		wp-gpios = <&gpio 57 0>;  /* gpio PH1 */
+		power-gpios = <&gpio 155 0>; /* gpio PT3 */
+	};
+
+	sdhci@c8000600 {
+		support-8bit;
+	};
+};
-- 
1.7.5.4
