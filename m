From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 5/5] ARM: dt: tegra: add the wifi led to paz00 device tree
Date: Sat, 28 Jan 2012 20:03:08 +0100
Message-ID: <a9f2b18eddc5cc1990d7a1717a3feb1bea5ae687.1327776641.git.marvin24@gmx.de>
References: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds the wifi led bound to the rfkill0 event to the device
tree of paz00.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 2a16ff0..31c2d08 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -102,4 +102,14 @@
 			gpio-key,wakeup;
 		};
 	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		wifi {
+			label = "wifi-led";
+			gpios = <&gpio 24 0>;
+			linux,default-trigger = "rfkill0";
+		};
+	};
 };
-- 
1.7.5.4
