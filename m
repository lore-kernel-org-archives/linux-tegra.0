From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Enable PWM on Venice2
Date: Mon, 18 Nov 2013 17:00:35 +0100
Message-ID: <1384790435-30269-2-git-send-email-treding@nvidia.com>
References: <1384790435-30269-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384790435-30269-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Subsequent patches will need to reference a PWM channel for backlight
support, so enable the PWM device and assign a label to it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-venice2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index bc502112eb04..302f47704834 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -14,6 +14,10 @@
 		status = "okay";
 	};
 
+	pwm: pwm@7000a000 {
+		status = "okay";
+	};
+
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <1>;
-- 
1.8.4.2
