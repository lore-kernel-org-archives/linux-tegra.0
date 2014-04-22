From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2 7/7] ARM: tegra: Add the EC i2c tunnel to tegra124-venice2
Date: Tue, 22 Apr 2014 09:45:54 -0700
Message-ID: <1398185154-19404-8-git-send-email-dianders@chromium.org>
References: <1398185154-19404-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398185154-19404-1-git-send-email-dianders@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lee.jones@linaro.org, swarren@nvidia.com, wsa@the-dreams.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, abrestic@chromium.org, sjg@chromium.org, swarren@wwwdotorg.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org, thierry.reding@gmail.com, galak@codeaurora.org, olof@lixom.net, dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

This adds the EC i2c tunnel (and devices under it) to the
tegra124-venice2 device tree.

Signed-off-by: Doug Anderson <dianders@chromium.org>
Tested-by: Andrew Bresticker <abrestic@chromium.org>
Tested-by: Stephen Warren <swarren@nvidia.com>
---
Changes in v2:
- Removed i2c20 alias for i2c tunnel

 arch/arm/boot/dts/tegra124-venice2.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index c17283c..89cf776 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -813,6 +813,32 @@
 
 			google,cros-ec-spi-msg-delay = <2000>;
 
+			i2c-tunnel {
+				compatible = "google,cros-ec-i2c-tunnel";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				google,remote-bus = <0>;
+
+				charger: bq24735@9 {
+					compatible = "ti,bq24735";
+					reg = <0x9>;
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA_GPIO(J, 0)
+							GPIO_ACTIVE_HIGH>;
+					ti,ac-detect-gpios = <&gpio
+							TEGRA_GPIO(J, 0)
+							GPIO_ACTIVE_HIGH>;
+				};
+
+				battery: sbs-battery@b {
+					compatible = "sbs,sbs-battery";
+					reg = <0xb>;
+					sbs,i2c-retry-count = <2>;
+					sbs,poll-retry-count = <1>;
+				};
+			};
+
 			cros-ec-keyb {
 				compatible = "google,cros-ec-keyb";
 				keypad,num-rows = <8>;
-- 
1.9.1.423.g4596e3a
