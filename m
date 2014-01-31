From: Andrew Chew <achew@nvidia.com>
Subject: [PATCH v1] ARM: tegra: add nvidia,wdt-timer-id optional property
Date: Fri, 31 Jan 2014 13:46:51 -0800
Message-ID: <1391204811-6293-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, swarren@wwwdotorg.org, thierry.reding@gmail.com, abrestic@chromium.org, dgreid@chromium.org, katierh@chromium.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Chew <achew@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This optional property can be used to specify which timers are to be used
for hardware watchdog timeouts (via a tegra wdt driver).

Signed-off-by: Andrew Chew <achew@nvidia.com>
---
 Documentation/devicetree/bindings/timer/nvidia,tegra30-timer.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra30-timer.txt b/Documentation/devicetree/bindings/timer/nvidia,tegra30-timer.txt
index b5082a1..e87fa70 100644
--- a/Documentation/devicetree/bindings/timer/nvidia,tegra30-timer.txt
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra30-timer.txt
@@ -13,6 +13,13 @@ Required properties:
 - clocks : Must contain one entry, for the module clock.
   See ../clocks/clock-bindings.txt for details.
 
+Optional properties:
+
+- nvidia,wdt-timer-id: A list of timer IDs to be used for watchdogs.
+    Watchdog 0 will be assigned to the first timer listed, watchdog 1 will
+    be assigned to the second timer listed, etc. up to the number of watchdogs
+    available.
+
 timer {
 	compatible = "nvidia,tegra30-timer", "nvidia,tegra20-timer";
 	reg = <0x60005000 0x400>;
@@ -23,4 +30,5 @@ timer {
 		      0 121 0x04
 		      0 122 0x04>;
 	clocks = <&tegra_car 214>;
+	nvidia,wdt-timer-id = <7 8>;
 };
-- 
1.8.1.5
