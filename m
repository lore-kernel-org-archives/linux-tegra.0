From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 2/2] ARM: tegra: Add lp_parent clock to dsi
Date: Fri, 19 Sep 2014 15:53:49 -0400
Message-ID: <1411156429-19797-2-git-send-email-seanpaul@chromium.org>
References: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411156429-19797-1-git-send-email-seanpaul@chromium.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

This patch adds the lp_parent clk to the dsi node for
tegra114. The TRM states that PLLP should be used
upstream of the low power dsi clock.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 80b8edd..20f78e7 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -99,7 +99,8 @@
 			clocks = <&tegra_car TEGRA114_CLK_DSIA>,
 				 <&tegra_car TEGRA114_CLK_DSIALP>,
 				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
-			clock-names = "dsi", "lp", "parent";
+				 <&tegra_car TEGRA114_CLK_PLL_P>;
+			clock-names = "dsi", "lp", "parent", "lp_parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			nvidia,mipi-calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
-- 
2.0.0
