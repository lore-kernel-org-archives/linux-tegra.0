From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/10] ARM: tegra: Enable power key on Venice2
Date: Thu, 19 Dec 2013 17:06:20 +0100
Message-ID: <1387469182-14398-9-git-send-email-treding@nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Contrary to the rest of the keyboard, which is connected to the ChromeOS
embedded controller, the power key is hooked up to a GPIO. Add a device
tree node to handle it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 0f6ff681b14b..b770e903fabb 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -739,6 +739,18 @@
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		power {
+			label = "Power";
+			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			gpio-key,wakeup;
+		};
+	};
+
 	panel: panel {
 		compatible = "lg,lp129qe", "simple-panel";
 
-- 
1.8.4.2
