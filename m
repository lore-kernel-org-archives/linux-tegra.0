From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 4/5] ARM: dt: tegra: add the power gpio key to paz00 device tree
Date: Sat, 28 Jan 2012 20:03:07 +0100
Message-ID: <71260c5a44e68a6f20e5b3d12952a8a701673919.1327776641.git.marvin24@gmx.de>
References: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds the wakeup gpio which is connected to the embedded
controller to the device tree of paz00.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index f03ca40..2a16ff0 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -91,4 +91,15 @@
 	sdhci@c8000600 {
 		support-8bit;
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio 79 1>; /* gpio PJ7, active low */
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+	};
 };
-- 
1.7.5.4
