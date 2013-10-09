From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/7] ARM: tegra: enable LP1 suspend mode for Venice2
Date: Wed, 9 Oct 2013 17:20:11 +0800
Message-ID: <1381310411-11391-8-git-send-email-josephl@nvidia.com>
References: <1381310411-11391-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381310411-11391-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable LP1 suspend mode for Tegra124 Venice2 board.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 279c7b5..2a3615b 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -20,6 +20,13 @@
 
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <1>;
+		nvidia,cpu-pwr-good-time = <500>;
+		nvidia,cpu-pwr-off-time = <300>;
+		nvidia,core-pwr-good-time = <641 3845>;
+		nvidia,core-pwr-off-time = <61036>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 	};
 
 	clocks {
-- 
1.8.4
