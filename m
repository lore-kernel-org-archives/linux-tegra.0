From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/4] ARM: dt: Add doc for ARM Snoop Control Unit(SCU)
Date: Mon, 17 Dec 2012 08:18:01 +0200
Message-ID: <1355725087-11363-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add scu.txt under arm for ARM Snoop Control Unit(SCU)

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/scu.txt |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/scu.txt

diff --git a/Documentation/devicetree/bindings/arm/scu.txt b/Documentation/devicetree/bindings/arm/scu.txt
new file mode 100644
index 0000000..96264cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/scu.txt
@@ -0,0 +1,15 @@
+* ARM Snoop Control Unit(SCU)
+
+ARM cores often have a configurable SCU to the memory system through
+the AXI interfaces.
+
+Required properties:
+
+- compatible : "arm,cortex-a9-scu"
+- reg : Specifies base physical address and size of the SCU registers.
+
+Example:
+	scu {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0x50040000 0x58>;
+	};
-- 
1.7.9.5
