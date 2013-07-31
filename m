From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/6] Documentation: New DT parameters for tegra30-usb-phy
Date: Wed, 31 Jul 2013 20:42:01 +0300
Message-ID: <1375292522-7855-6-git-send-email-ttynkkynen@nvidia.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292522-7855-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Document the new device tree parameters for Tegra30 USB PHY.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt    | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
index 59c4854..8b5901d 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
@@ -3,7 +3,7 @@ Tegra SOC USB PHY
 The device node for Tegra SOC USB PHY:
 
 Required properties :
- - compatible : Should be "nvidia,tegra20-usb-phy".
+ - compatible : Should be "nvidia,tegra<chip>-usb-phy".
  - reg : Defines the following set of registers, in the order listed:
    - The PHY's own register set.
      Always present.
@@ -24,17 +24,26 @@ Required properties :
 Required properties for phy_type == ulpi:
   - nvidia,phy-reset-gpio : The GPIO used to reset the PHY.
 
-Required PHY timing params for utmi phy:
+Required PHY timing params for utmi phy, for all chips:
   - nvidia,hssync-start-delay : Number of 480 Mhz clock cycles to wait before
     start of sync launches RxActive
   - nvidia,elastic-limit : Variable FIFO Depth of elastic input store
   - nvidia,idle-wait-delay : Number of 480 Mhz clock cycles of idle to wait
     before declare IDLE.
   - nvidia,term-range-adj : Range adjusment on terminations
-  - nvidia,xcvr-setup : HS driver output control
+  - Either one of the following for HS driver output control:
+    - nvidia,xcvr-setup : integer, uses the provided value.
+    - nvidia,xcvr-setup-use-fuses : boolean, indicates that the value is read
+      from the on-chip fuses
+    If both are provided, nvidia,xcvr-setup-use-fuses takes precedence.
   - nvidia,xcvr-lsfslew : LS falling slew rate control.
   - nvidia,xcvr-lsrslew :  LS rising slew rate control.
 
+Required PHY timing params for utmi phy, only on Tegra30 and above:
+  - nvidia,xcvr-hsslew : HS slew rate control.
+  - nvidia,hssquelch-level : HS squelch detector level.
+  - nvidia,hsdiscon-level : HS disconnect detector level.
+
 Optional properties:
   - nvidia,has-legacy-mode : boolean indicates whether this controller can
     operate in legacy mode (as APX 2500 / 2600). In legacy mode some
-- 
1.8.1.5
