From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: [PATCH] ARM: tegra: harmony: Add ADT7641 temperature sensor
Date: Fri,  9 Nov 2012 13:56:55 +0100
Message-ID: <1352465815-26984-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The Harmony board has an Analog Devices ADT7461 temperature sensor
connected to the DVC bus. It can be used to monitor the ambient (local)
and on-die (remote) temperatures.

Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
---
 arch/arm/boot/dts/tegra20-harmony.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-harmony.dts b/arch/arm/boot/dts/tegra20-harmony.dts
index 3ab0f44..ed55d50 100644
--- a/arch/arm/boot/dts/tegra20-harmony.dts
+++ b/arch/arm/boot/dts/tegra20-harmony.dts
@@ -396,6 +396,11 @@
 				};
 			};
 		};
+
+		adt7461@4c {
+			compatible = "adi,adt7461";
+			reg = <0x4c>;
+		};
 	};
 
 	pmc {
-- 
1.8.0
