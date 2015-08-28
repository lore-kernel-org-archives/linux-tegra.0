From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 05/11] arm: tegra: colibri_t30: fix comment about 3v3 fixed supply
Date: Fri, 28 Aug 2015 17:59:40 +0200
Message-ID: <1440777586-19545-6-git-send-email-marcel.ziswiler@toradex.com>
References: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Fix the comment about the 3v3 fixed supply as the previous v3_3 was
bogus.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 4ddccfa..57335c3 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -252,7 +252,7 @@
 				/*
 				 * EN_+V3.3 switching via FET:
 				 * +V3.3_AUDIO_AVDD_S, +V3.3 and +V1.8_VDD_LAN
-				 * see also v3_3 fixed supply
+				 * see also 3v3 fixed supply
 				 */
 				ldo2_reg: ldo2 {
 					regulator-name = "en_3v3";
-- 
2.4.3
