From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [PATCH 03/11] arm: tegra: colibri_t30: improve comment about thermal
 alert pin
Date: Fri, 28 Aug 2015 17:59:38 +0200
Message-ID: <1440777586-19545-4-git-send-email-marcel.ziswiler@toradex.com>
References: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440777586-19545-1-git-send-email-marcel.ziswiler@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Improve the comment about the THERMD_ALERT# pin which is the unlatched
I2C address pin of the LM95245 temperature sensor and therefore
requires disabling for now otherwise it won't get detected properly.

While at it also move that pin further down to have it alphabetically
sorted again.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 arch/arm/boot/dts/tegra30-colibri.dtsi | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 5e6a47e..074123f 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -66,15 +66,6 @@
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
 
-			/* Thermal alert, need to be disabled */
-			lcd_dc1_pd2 {
-				nvidia,pins = "lcd_dc1_pd2";
-				nvidia,function = "rsvd3";
-				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
-				nvidia,tristate = <TEGRA_PIN_DISABLE>;
-				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
-			};
-
 			/* Colibri MMC */
 			kb_row10_ps2 {
 				nvidia,pins = "kb_row10_ps2";
@@ -167,6 +158,19 @@
 				nvidia,pull = <TEGRA_PIN_PULL_UP>;
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 			};
+
+			/*
+			 * THERMD_ALERT#, unlatched I2C address pin of LM95245
+			 * temperature sensor therefore requires disabling for
+			 * now
+			 */
+			lcd_dc1_pd2 {
+				nvidia,pins = "lcd_dc1_pd2";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
 		};
 	};
 
-- 
2.4.3
