From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 1/4] media: dt: bindings: Add binding for NVIDIA Tegra
 Video Decoder Engine
Date: Tue, 12 Dec 2017 03:26:07 +0300
Message-ID: <155182bb32443b69e457adbd642c12da81b0a241.1513038011.git.digetx@gmail.com>
References: <cover.1513038011.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1513038011.git.digetx@gmail.com>
In-Reply-To: <cover.1513038011.git.digetx@gmail.com>
References: <cover.1513038011.git.digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add binding documentation for the Video Decoder Engine which is found
on NVIDIA Tegra20/30/114/124/132 SoC's.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/nvidia,tegra-vde.txt | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
new file mode 100644
index 000000000000..470237ed6fe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
@@ -0,0 +1,55 @@
+NVIDIA Tegra Video Decoder Engine
+
+Required properties:
+- compatible : Must contain one of the following values:
+   - "nvidia,tegra20-vde"
+   - "nvidia,tegra30-vde"
+   - "nvidia,tegra114-vde"
+   - "nvidia,tegra124-vde"
+   - "nvidia,tegra132-vde"
+- reg : Must contain an entry for each entry in reg-names.
+- reg-names : Must include the following entries:
+  - sxe
+  - bsev
+  - mbe
+  - ppe
+  - mce
+  - tfe
+  - ppb
+  - vdma
+  - frameid
+- iram : Must contain phandle to the mmio-sram device node that represents
+         IRAM region used by VDE.
+- interrupts : Must contain an entry for each entry in interrupt-names.
+- interrupt-names : Must include the following entries:
+  - sync-token
+  - bsev
+  - sxe
+- clocks : Must include the following entries:
+  - vde
+- resets : Must include the following entries:
+  - vde
+
+Example:
+
+video-codec@6001a000 {
+	compatible = "nvidia,tegra20-vde";
+	reg = <0x6001a000 0x1000 /* Syntax Engine */
+	       0x6001b000 0x1000 /* Video Bitstream Engine */
+	       0x6001c000  0x100 /* Macroblock Engine */
+	       0x6001c200  0x100 /* Post-processing Engine */
+	       0x6001c400  0x100 /* Motion Compensation Engine */
+	       0x6001c600  0x100 /* Transform Engine */
+	       0x6001c800  0x100 /* Pixel prediction block */
+	       0x6001ca00  0x100 /* Video DMA */
+	       0x6001d800  0x300 /* Video frame controls */>;
+	reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
+		    "tfe", "ppb", "vdma", "frameid";
+	iram = <&vde_pool>; /* IRAM region */
+	interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
+		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
+		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
+	interrupt-names = "sync-token", "bsev", "sxe";
+	clocks = <&tegra_car TEGRA20_CLK_VDE>;
+	resets = <&tegra_car 61>;
+};
-- 
2.15.1
