From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v8 08/18] ARM: tegra: Add EMC to Tegra124 device tree
Date: Thu, 12 Mar 2015 15:48:00 +0100
Message-ID: <1426171746-26864-9-git-send-email-tomeu.vizoso@collabora.com>
References: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1426171746-26864-1-git-send-email-tomeu.vizoso@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

This adds a node for the EMC memory controller. It is always enabled, but only
provides read-only functionality without board-specific timing tables.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

---

v5: Add a phandle to the CAR node that points to the EMC node
---
 arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 4be06c6..0fff4fb 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -207,6 +207,7 @@
 		reg = <0x0 0x60006000 0x0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@0,60007000 {
@@ -569,6 +570,13 @@
 		#iommu-cells = <1>;
 	};
 
+	emc: emc@0,7001b000 {
+		compatible = "nvidia,tegra124-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>;
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	sata@0,70020000 {
 		compatible = "nvidia,tegra124-ahci";
 
-- 
2.1.0
