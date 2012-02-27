From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 13/20] tegra: usb: fdt: Add USB definitions for
	Tegra2 Seaboard
Date: Mon, 27 Feb 2012 12:52:46 -0800
Message-ID: <1330375973-10681-14-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, linux-tegra@vger.kernel.org, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

We set up two USB ports, one of which can be host or device.
For some reason the kernel version does enable both ports.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Remove 0x from fdt aliases
- Use "okay" instead of "ok" for fdt node status

Changes in v3:
- Disable USB2 which is not used on Seaboard
- Fix device tree indenting with tabs instead of spaces
- Remove "okay" from nodes since this is the default anyway

Changes in v5:
- Remove support-host-mode property

Changes in v6:
- Remove dr_mode properties from SOC .dtsi file and move to boards

 board/nvidia/dts/tegra2-seaboard.dts |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 87f58fb..4fbb252 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -11,6 +11,12 @@
 		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
 	};
 
+	aliases {
+		/* This defines the order of our USB ports */
+		usb0 = "/usb@c5008000";
+		usb1 = "/usb@c5000000";
+	};
+
 	memory {
 		device_type = "memory";
 		reg = < 0x00000000 0x40000000 >;
@@ -42,5 +48,10 @@
 
 	usb@c5000000 {
 		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
+		dr_mode = "otg";
+	};
+
+	usb@c5004000 {
+		status = "disabled";
 	};
 };
-- 
1.7.7.3
