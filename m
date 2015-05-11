From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 05/12] dt: panel: Add property "te-polarity"
Date: Mon, 11 May 2015 09:38:24 +0800
Message-ID: <1431308311-4470-6-git-send-email-markz@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431308311-4470-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

te-polarity indicates the polarity of panel's TE(Tearing Effect) signal.
Normally the TE pin is connected to the host SoC. The display
controller will send a new frame to panel when the TE signal is
triggered.

Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt | 2 ++
 arch/arm/boot/dts/tegra114-dalmore.dts                        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
index f522bb8e47e1..680ebec9a927 100644
--- a/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
+++ b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
@@ -23,6 +23,7 @@ Required properties (for DSI-LINK1 only):
 - link2: phandle to the DSI peripheral on the secondary link. Note that the
   presence of this property marks the containing node as DSI-LINK1.
 - power-supply: phandle of the regulator that provides the supply voltage
+- te-polarity: indicates the TE(Tearing Effect) polarity. 0: Low, 1: High.
 
 Optional properties (for DSI-LINK1 only):
 - backlight: phandle of the backlight device attached to the panel
@@ -38,6 +39,7 @@ Example:
 
 			power-supply = <...>;
 			backlight = <...>;
+			te-polarity = <0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8b7aa0dcdc6e..fdb1cc4063a9 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -47,6 +47,8 @@
 
 				power-supply = <&avdd_lcd_reg>;
 				backlight = <&backlight>;
+
+				te-polarity = <0>; /* TE_POLARITY_LOW */
 			};
 		};
 	};
-- 
2.1.4
