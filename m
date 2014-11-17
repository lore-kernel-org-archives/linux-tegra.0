From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V5 06/12] of: Update Tegra XUSB pad controller binding for USB
Date: Mon, 17 Nov 2014 14:41:36 -0800
Message-ID: <1416264102-1323-7-git-send-email-abrestic@chromium.org>
References: <1416264102-1323-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416264102-1323-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add new bindings used for USB support by the Tegra XUSB pad controller.
This includes additional PHY types, USB-specific pinconfig properties, etc.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from v4:
 - nvidia,usb2-port-num -> nvidia,usb2-port
 - Made usb3-port a pinconfig property
 - Adjusted property descriptions as suggested by Thierry.
No changes from v3.
Changes from v2:
 - Added nvidia,otg-hs-curr-level-offset property.
 - Dropped "-otg" from VBUS supplies.
 - Added mbox-names property.
 - Removed extra whitespace.
Changes from v1:
 - Updated to use common mailbox bindings.
 - Made USB3 port-to-lane mappins a top-level binding rather than a pinconfig
   binding.
 - Add #defines for the padctl lanes.
---
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        | 63 +++++++++++++++++++---
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |  7 +++
 2 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 2f9c0bd..80895d1 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -21,6 +21,15 @@ Required properties:
   - padctl
 - #phy-cells: Should be 1. The specifier is the index of the PHY to reference.
   See <dt-bindings/pinctrl/pinctrl-tegra-xusb.h> for the list of valid values.
+- mboxes: Must contain an entry for the XUSB mailbox channel.
+  See ../mailbox/mailbox.txt for details.
+- mbox-names: Must include the following entries:
+  - xusb
+
+Optional properties:
+-------------------
+- vbus-{0,1,2}-supply: VBUS regulator for the corresponding UTMI pad.
+- vddio-hsic-supply: VDDIO regulator for the HSIC pads.
 
 Lane muxing:
 ------------
@@ -50,26 +59,46 @@ Optional properties:
   pin or group should be assigned to. Valid values for function names are
   listed below.
 - nvidia,iddq: Enables IDDQ mode of the lane. (0: no, 1: yes)
+- nvidia,usb2-port: USB2 port (0, 1, or 2) to which the lane is mapped.
+- nvidia,usb3-port: USB3 port (0 or 1) to which the lane is mapped.
+- nvidia,hsic-strobe-trim: HSIC strobe trimmer value.
+- nvidia,hsic-rx-strobe-trim: HSIC RX strobe trimmer value. (0 - 7)
+- nvidia,hsic-rx-data-trim: HSIC RX data trimmer value. (0 - 7)
+- nvidia,hsic-tx-rtune-n: HSIC TX RTUNEN value. (0 - 7)
+- nvidia,hsic-tx-rtune-p: HSIC TX RTUNEP value. (0 - 7)
+- nvidia,hsic-tx-slew-n: HSIC TX SLEWN value. (0 - 7)
+- nvidia,hsic-tx-slew-p: HSIC TX SLEWP value. (0 - 7)
+- nvidia,hsic-auto-term: Enables HSIC AUTO_TERM. (0: no, 1: yes)
+- nvidia,otg-hs-curr-level-offset: Offset to be applied to the pad's fused
+  HS_CURR_LEVEL value. (0 - 63)
 
 Note that not all of these properties are valid for all lanes. Lanes can be
-divided into three groups:
+divided into four groups:
 
   - otg-0, otg-1, otg-2:
 
     Valid functions for this group are: "snps", "xusb", "uart", "rsvd".
 
-    The nvidia,iddq property does not apply to this group.
+    Only the nvidia,otg-hs-curr-level-offset property applies.
+
+  - ulpi-0:
 
-  - ulpi-0, hsic-0, hsic-1:
+    Valid functions for this group are: "snps", "xusb".
+
+  - hsic-0, hsic-1:
 
     Valid functions for this group are: "snps", "xusb".
 
-    The nvidia,iddq property does not apply to this group.
+    Only the nvidia,hsic-* properties apply, and only when the function is
+    xusb.
 
   - pcie-0, pcie-1, pcie-2, pcie-3, pcie-4, sata-0:
 
     Valid functions for this group are: "pcie", "usb3", "sata", "rsvd".
 
+    Only the nvidia,iddq, nvidia,usb2-port, and nvidia,usb3-port properties
+    apply. The nvidia,usb2-port and nvidia,usb3-port properties are required
+    when the function is usb3.
 
 Example:
 ========
@@ -82,6 +111,8 @@ SoC file extract:
 		reg = <0x0 0x7009f000 0x0 0x1000>;
 		resets = <&tegra_car 142>;
 		reset-names = "padctl";
+		mboxes = <&xusb_mbox>;
+		mbox-names = "xusb";
 
 		#phy-cells = <1>;
 	};
@@ -100,15 +131,35 @@ Board file extract:
 
 	...
 
+	usb@0,70090000 {
+		...
+
+		phys = <&padctl 5>, <&padctl 6>, <&padctl 7>;
+		phy-names = "utmi-1", "utmi-2", "usb3-0";
+
+		...
+	}
+
+	...
+
 	padctl: padctl@0,7009f000 {
 		pinctrl-0 = <&padctl_default>;
 		pinctrl-names = "default";
 
+		vbus-2-supply = <&vdd_usb3_vbus>;
+
 		padctl_default: pinmux {
-			usb3 {
-				nvidia,lanes = "pcie-0", "pcie-1";
+			otg {
+				nvidia,lanes = "otg-1", "otg-2";
+				nvidia,function = "xusb";
+			};
+
+			usb3p0 {
+				nvidia,lanes = "pcie-0";
 				nvidia,function = "usb3";
 				nvidia,iddq = <0>;
+				nvidia,usb2-port = <2>;
+				nvidia,usb3-port = <0>;
 			};
 
 			pcie {
diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
index 914d56d..c83a4d4 100644
--- a/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
+++ b/include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h
@@ -3,5 +3,12 @@
 
 #define TEGRA_XUSB_PADCTL_PCIE 0
 #define TEGRA_XUSB_PADCTL_SATA 1
+#define TEGRA_XUSB_PADCTL_USB3_P0 2
+#define TEGRA_XUSB_PADCTL_USB3_P1 3
+#define TEGRA_XUSB_PADCTL_UTMI_P0 4
+#define TEGRA_XUSB_PADCTL_UTMI_P1 5
+#define TEGRA_XUSB_PADCTL_UTMI_P2 6
+#define TEGRA_XUSB_PADCTL_HSIC_P0 7
+#define TEGRA_XUSB_PADCTL_HSIC_P1 8
 
 #endif /* _DT_BINDINGS_PINCTRL_TEGRA_XUSB_H */
-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
