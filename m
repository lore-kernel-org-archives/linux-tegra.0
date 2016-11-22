From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 2/6] apalis-tk1: temp alert pull-up
Date: Tue, 22 Nov 2016 01:14:03 +0100
Message-ID: <1479773647-14726-3-git-send-email-marcel.ziswiler@toradex.com>
References: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Pull-up GPIO_PI6 connected to TMP451's ALERT#/THERM2#.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra124-apalis.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 6aa4952..0534601 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1151,11 +1151,11 @@
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
 
-			/* GPIO_PI6 aka TEMP_ALERT_L */
+			/* GPIO_PI6 aka TMP451 ALERT#/THERM2# */
 			pi6 {
 				nvidia,pins = "pi6";
 				nvidia,function = "rsvd1";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_ENABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
-- 
2.5.5
