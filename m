From: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dt: tegra: paz00: configure power off
Date: Sat, 12 Mar 2016 00:00:00 +0300
Message-ID: <1457730000-11868-1-git-send-email-zombah@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add DT property to tell the regulator that it should provide
the pm_power_off() implementation. This fix "shutdown" issue
on this device.

Signed-off-by: Misha Komarovskiy <zombah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Tested on current mainline version, ac100 models 116 and 117,
successful rate of "shutdown" increased from 10% to 90%.

 arch/arm/boot/dts/tegra20-paz00.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ed7e100..c82e3ae 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -316,6 +316,8 @@
 			#gpio-cells = <2>;
 			gpio-controller;
 
+			ti,system-power-controller;
+
 			sys-supply = <&p5valw_reg>;
 			vin-sm0-supply = <&sys_reg>;
 			vin-sm1-supply = <&sys_reg>;
-- 
1.8.4.5
