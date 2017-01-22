From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 3/5] ARM: tegra: nyan-big: Include compatible revisions for
 proper detection
Date: Sun, 22 Jan 2017 15:44:13 +0100
Message-ID: <20170122144415.31208-3-contact@paulk.fr>
References: <20170122144415.31208-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170122144415.31208-1-contact@paulk.fr>
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>, Stephen Warren <swarren@wwwdotorg.org>, Paul Kocialkowski <contact@paulk.fr>, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Depthcharge (the payload used with cros devices) will attempt to detect
boards using their revision. This includes all the known revisions for
the nyan-big board so that the dtb can be selected preferably.

Defining compatibly revisions allows depthcharge to select the kernel
via the revision it detects instead of using the default kernel. This
allows having a FIT image with multiple kernels for multiple devices.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 67d7cfb32541..f12ece9b76a6 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -6,7 +6,12 @@
 
 / {
 	model = "Acer Chromebook 13 CB5-311";
-	compatible = "google,nyan-big", "nvidia,tegra124";
+	compatible = "google,nyan-big-rev7", "google,nyan-big-rev6",
+			"google,nyan-big-rev5", "google,nyan-big-rev4",
+			"google,nyan-big-rev3", "google,nyan-big-rev2",
+			"google,nyan-big-rev5", "google,nyan-big-rev4",
+			"google,nyan-big-rev1", "google,nyan-big-rev0",
+			"google,nyan-big", "google,nyan", "nvidia,tegra124";
 
 	panel: panel {
 		compatible = "auo,b133xtn01";
-- 
2.11.0
