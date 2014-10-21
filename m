From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 07/12] ARM: tegra: Add EMC to Tegra124 device tree
Date: Tue, 21 Oct 2014 16:45:39 +0200
Message-ID: <1413902788-7727-8-git-send-email-tomeu.vizoso@collabora.com>
References: <1413902788-7727-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1413902788-7727-1-git-send-email-tomeu.vizoso@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

This adds a node for the EMC memory controller. It is always enabled, but only
provides read-only functionality without board-specific timing tables.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 0ee30f6..97c9f8b 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -567,6 +567,13 @@
 		#iommu-cells = <1>;
 	};
 
+	emc@0,7001b000 {
+		compatible = "nvidia,tegra124-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>;
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	sata@0,70020000 {
 		compatible = "nvidia,tegra124-ahci";
 
-- 
1.9.3
