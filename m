From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 11/11] arm: tegra: colibri_t30: fix power/wakeup key for eval board
Date: Fri, 28 Aug 2015 17:59:46 +0200
Message-ID: <1440777586-19545-12-git-send-email-marcel.ziswiler@toradex.com>
References: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Rather than a power key SODIMM pin 45 is actually used for wake-up
purpose which this patch fixes.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index a6c98b1..3ff019f 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -137,10 +137,10 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
-			label = "Power";
+		wakeup {
+			label = "SODIMM pin 45 wakeup";
 			gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
-			linux,code = <KEY_POWER>;
+			linux,code = <KEY_WAKEUP>;
 			debounce-interval = <10>;
 			gpio-key,wakeup;
 		};
-- 
2.4.3
