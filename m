From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/5] ARM: dt: tegra: add ADT7461 temperature sensor to paz00 device tree
Date: Sat, 28 Jan 2012 20:03:06 +0100
Message-ID: <58e24ac63a8388bb9de6be0e75cea26a1af99195.1327776641.git.marvin24@gmx.de>
References: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the ADT7461 temperature monitoring IC which is connected via
the DVC controller.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index f667343..f03ca40 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -35,6 +35,11 @@
 
 	i2c@7000d000 {
 		clock-frequency = <400000>;
+
+		adt7461@4c {
+			compatible = "adt7461";
+			reg = <0x4c>;
+		};
 	};
 
 	i2s@70002800 {
-- 
1.7.5.4
