From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/3] of: Add NVIDIA Tegra flow controller bindings
Date: Tue, 26 Aug 2014 08:14:02 +0200
Message-ID: <1409033644-24376-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add device tree bindings for the flow controller found on NVIDIA Tegra
SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3:
- collapse identical bindings into a single file

 .../bindings/arm/tegra/nvidia,tegra20-flowctrl.txt           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
new file mode 100644
index 000000000000..ccf0adddc820
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-flowctrl.txt
@@ -0,0 +1,12 @@
+NVIDIA Tegra Flow Controller
+
+Required properties:
+- compatible: Should be "nvidia,tegra<chip>-flowctrl"
+- reg: Should contain one register range (address and length)
+
+Example:
+
+	flow-controller@60007000 {
+		compatible = "nvidia,tegra20-flowctrl";
+		reg = <0x60007000 0x1000>;
+	};
-- 
2.0.4
