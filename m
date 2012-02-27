From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 06/20] tegra: fdt: Add device tree file for Tegra2 Seaboard from kernel
Date: Mon, 27 Feb 2012 12:52:39 -0800
Message-ID: <1330375973-10681-7-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This was taken from commit b48c54e2 at:
git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 board/nvidia/dts/tegra2-seaboard.dts |   36 ++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 board/nvidia/dts/tegra2-seaboard.dts

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
new file mode 100644
index 0000000..dde5d03
--- /dev/null
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -0,0 +1,36 @@
+/dts-v1/;
+
+/memreserve/ 0x1c000000 0x04000000;
+/include/ ARCH_CPU_DTS
+
+/ {
+	model = "NVIDIA Seaboard";
+	compatible = "nvidia,seaboard", "nvidia,tegra20";
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
+		clock-frequency = < 216000000 >;
+	};
+
+	sdhci@c8000400 {
+		cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+		wp-gpios = <&gpio 57 0>; /* gpio PH1 */
+		power-gpios = <&gpio 70 0>; /* gpio PI6 */
+	};
+
+	sdhci@c8000600 {
+		support-8bit;
+	};
+
+	usb@c5000000 {
+		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
+	};
+};
-- 
1.7.7.3
