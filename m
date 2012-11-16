From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: plutux: Enable HDMI output
Date: Fri, 16 Nov 2012 16:56:51 +0100
Message-ID: <1353081412-19448-3-git-send-email-thierry.reding@avionic-design.de>
References: <1353081412-19448-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353081412-19448-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Enable the HDMI output found on Plutux boards.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-plutux.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-plutux.dts b/arch/arm/boot/dts/tegra20-plutux.dts
index 331a3ef..2894800 100644
--- a/arch/arm/boot/dts/tegra20-plutux.dts
+++ b/arch/arm/boot/dts/tegra20-plutux.dts
@@ -6,6 +6,12 @@
 	model = "Avionic Design Plutux board";
 	compatible = "ad,plutux", "ad,tamonten", "nvidia,tegra20";
 
+	host1x {
+		hdmi {
+			status = "okay";
+		};
+	};
+
 	i2c@7000c000 {
 		wm8903: wm8903@1a {
 			compatible = "wlf,wm8903";
-- 
1.8.0
