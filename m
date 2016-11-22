From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 3/6] apalis-tk1: optional displayport hot-plug detect
Date: Tue, 22 Nov 2016 01:14:04 +0100
Message-ID: <1479773647-14726-4-git-send-email-marcel.ziswiler@toradex.com>
References: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479773647-14726-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Configure DP_HPD_PFF0 pin as optional DisplayPort hot-plug detect.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra124-apalis.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 0534601..747ce81 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -255,7 +255,7 @@
 			};
 			dp_hpd_pff0 {
 				nvidia,pins = "dp_hpd_pff0";
-				nvidia,function = "rsvd2";
+				nvidia,function = "dp";
 				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-- 
2.5.5
