From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH 2/5] ARM: tegra: nyan: Use external control for bq24735 charger
Date: Sun, 22 Jan 2017 15:44:12 +0100
Message-ID: <20170122144415.31208-2-contact@paulk.fr>
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

Nyan boards come with an embedded controller that controls when to
enable and disable the charge. Thus, it should not be left up to the
kernel to handle that.

Using the ti,external-control property allows specifying this use-case.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index ef430aa30152..5cf987b5401e 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -335,6 +335,7 @@
 					ti,ac-detect-gpios = <&gpio
 							TEGRA_GPIO(J, 0)
 							GPIO_ACTIVE_HIGH>;
+					ti,external-control;
 				};
 
 				battery: sbs-battery@b {
-- 
2.11.0
