From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/3] dt: arm: paz00: add rfkill switch to device tree
Date: Sun,  5 Feb 2012 18:18:42 +0100
Message-ID: <1e6659a5ec782d64ae24c1bb222fa1474594a447.1328461986.git.marvin24@gmx.de>
References: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <215249735783e9fe35db1c594d901f591725de50.1328461986.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Adds rfkill switch information to the device tree of paz00.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 255851d..28f2c6a 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -131,4 +131,15 @@
 			linux,default-trigger = "rfkill0";
 		};
 	};
+
+	rfkill-gpio {
+		compatible = "rfkill-gpio";
+
+		wifi {
+			label = "wifi";
+			reset-gpio = <&gpio 85 0>;
+			shutdown-gpio = <&gpio 25 0>;
+			type = <1>;
+		};
+	};
 };
-- 
1.7.5.4
