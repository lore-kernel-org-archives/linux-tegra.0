From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 4/4] ARM: tegra: nyan-blaze: Include compatible revisions for
 proper detection
Date: Sun, 28 Aug 2016 19:32:46 +0200
Message-ID: <20160828173246.32621-4-contact@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160828173246.32621-1-contact@paulk.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Paul Kocialkowski <contact@paulk.fr>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Depthcharge (the payload used with cros devices) will attempt to detect
boards using their revision. This includes all the known revisions for
the nyan-blaze board so that the dtb can be selected preferably.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index c9582361..aca0828 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -6,7 +6,13 @@
 
 / {
 	model = "HP Chromebook 14";
-	compatible = "google,nyan-blaze", "google,nyan", "nvidia,tegra124";
+	compatible = "google,nyan-blaze-rev10", "google,nyan-blaze-rev9",
+			"google,nyan-blaze-rev8", "google,nyan-blaze-rev7",
+			"google,nyan-blaze-rev6", "google,nyan-blaze-rev5",
+			"google,nyan-blaze-rev4", "google,nyan-blaze-rev3",
+			"google,nyan-blaze-rev2", "google,nyan-blaze-rev1",
+			"google,nyan-blaze-rev0", "google,nyan-blaze",
+			"google,nyan", "nvidia,tegra124";
 
 	panel: panel {
 		compatible = "samsung,ltn140at29-301";
-- 
2.9.3
