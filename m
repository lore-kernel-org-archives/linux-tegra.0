From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: seaboard: add missing DT vendor prefixes
Date: Mon, 19 Nov 2012 15:34:44 -0700
Message-ID: <1353364484-5741-2-git-send-email-swarren@wwwdotorg.org>
References: <1353364484-5741-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353364484-5741-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

A couple devices' DT compatible values only contained the device name
without any vendor prefix. Add the missing vendor prefixes.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-seaboard.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-seaboard.dts b/arch/arm/boot/dts/tegra20-seaboard.dts
index eafeca6..4204598 100644
--- a/arch/arm/boot/dts/tegra20-seaboard.dts
+++ b/arch/arm/boot/dts/tegra20-seaboard.dts
@@ -492,12 +492,12 @@
 		};
 
 		temperature-sensor@4c {
-			compatible = "nct1008";
+			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 		};
 
 		magnetometer@c {
-			compatible = "ak8975";
+			compatible = "ak,ak8975";
 			reg = <0xc>;
 			interrupt-parent = <&gpio>;
 			interrupts = <109 0x04>; /* gpio PN5 */
-- 
1.7.10.4
