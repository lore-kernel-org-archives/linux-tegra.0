From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] ARM: tegra: import latest Jetson TK1 spreadsheet
Date: Tue, 21 Jun 2016 12:51:49 -0600
Message-ID: <20160621185149.20625-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

This imports v11 of "Jetson TK1 Development Platform Pin Mux" from
https://developer.nvidia.com/embedded/downloads.

The new version defines the mux option for the MIPI pad ctrl selection.
The OWR pin no longer has an entry in the configuration table because
the only mux option it support is OWR, that feature isn't supported, and
hence can't conflict with any other pin. This pin can only usefully be
used as a GPIO.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 941f36263c8f..24bab492a9ca 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1356,14 +1356,6 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 			};
-			owr {
-				nvidia,pins = "owr";
-				nvidia,function = "rsvd2";
-				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
-				nvidia,tristate = <TEGRA_PIN_ENABLE>;
-				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
-				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
-			};
 			clk_32k_in {
 				nvidia,pins = "clk_32k_in";
 				nvidia,function = "clk";
@@ -1378,6 +1370,10 @@
 				nvidia,tristate = <TEGRA_PIN_DISABLE>;
 				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 			};
+			dsi_b {
+				nvidia,pins = "mipi_pad_ctrl_dsi_b";
+				nvidia,function = "dsi_b";
+			};
 		};
 	};
 
-- 
2.9.0
