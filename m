From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] ARM: tegra: apalis t30: fix device tree compatible node
Date: Wed, 23 Jul 2014 04:23:00 +0200
Message-ID: <aa2cbaac07707c3d64599d3841b9d6f77567a91f.1406081870.git.marcel@ziswiler.com>
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
To: swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, stefan@agner.ch, marcel@ziswiler.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Working on sound support I noticed the Apalis T30 Evaluation board
device tree missing the more generic Apalis T30 compatible string.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
---
 arch/arm/boot/dts/tegra30-apalis-eval.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9921433..45d40f0 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -5,7 +5,7 @@
 
 / {
 	model = "Toradex Apalis T30 on Apalis Evaluation Board";
-	compatible = "toradex,apalis_t30-eval", "nvidia,tegra30";
+	compatible = "toradex,apalis_t30-eval", "toradex,apalis_t30", "nvidia,tegra30";
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-- 
1.7.9.5
