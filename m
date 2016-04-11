From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: tegra: Rename some bindings for consistency
Date: Mon, 11 Apr 2016 15:58:06 +0200
Message-ID: <1460383086-26957-2-git-send-email-thierry.reding@gmail.com>
References: <1460383086-26957-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460383086-26957-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Device tree binding for NVIDIA Tegra have traditionally carried the
"nvidia," vendor prefix in the filename. A couple of odd ones don't, so
fix them up for consistency.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/ata/nvidia,tegra-ahci.txt  |  32 ++
 .../devicetree/bindings/ata/tegra-sata.txt         |  32 --
 .../bindings/dma/nvidia,tegra20-apbdma.txt         |  44 +++
 .../devicetree/bindings/dma/tegra20-apbdma.txt     |  44 ---
 .../memory-controllers/nvidia,tegra-emc.txt        | 374 +++++++++++++++++++++
 .../bindings/memory-controllers/tegra-emc.txt      | 374 ---------------------
 .../bindings/thermal/nvidia,tegra-soctherm.txt     |  67 ++++
 .../devicetree/bindings/thermal/tegra-soctherm.txt |  67 ----
 8 files changed, 517 insertions(+), 517 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt
 delete mode 100644 Documentation/devicetree/bindings/ata/tegra-sata.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
 delete mode 100644 Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
 delete mode 100644 Documentation/devicetree/bindings/thermal/tegra-soctherm.txt

diff --git a/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt b/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt
new file mode 100644
index 000000000000..66c83c3e8915
--- /dev/null
+++ b/Documentation/devicetree/bindings/ata/nvidia,tegra-ahci.txt
@@ -0,0 +1,32 @@
+Tegra124 SoC SATA AHCI controller
+
+Required properties :
+- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".  Otherwise,
+  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where <chip>
+  is tegra132.
+- reg : Should contain 2 entries:
+  - AHCI register set (SATA BAR5)
+  - SATA register set
+- interrupts : Defines the interrupt used by SATA
+- clocks : Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names : Must include the following entries:
+  - sata
+  - sata-oob
+  - cml1
+  - pll_e
+- resets : Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names : Must include the following entries:
+  - sata
+  - sata-oob
+  - sata-cold
+- phys : Must contain an entry for each entry in phy-names.
+  See ../phy/phy-bindings.txt for details.
+- phy-names : Must include the following entries:
+  - sata-phy : XUSB PADCTL SATA PHY
+- hvdd-supply : Defines the SATA HVDD regulator
+- vddio-supply : Defines the SATA VDDIO regulator
+- avdd-supply : Defines the SATA AVDD regulator
+- target-5v-supply : Defines the SATA 5V power regulator
+- target-12v-supply : Defines the SATA 12V power regulator
diff --git a/Documentation/devicetree/bindings/ata/tegra-sata.txt b/Documentation/devicetree/bindings/ata/tegra-sata.txt
deleted file mode 100644
index 66c83c3e8915..000000000000
--- a/Documentation/devicetree/bindings/ata/tegra-sata.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Tegra124 SoC SATA AHCI controller
-
-Required properties :
-- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".  Otherwise,
-  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where <chip>
-  is tegra132.
-- reg : Should contain 2 entries:
-  - AHCI register set (SATA BAR5)
-  - SATA register set
-- interrupts : Defines the interrupt used by SATA
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - sata
-  - sata-oob
-  - cml1
-  - pll_e
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - sata
-  - sata-oob
-  - sata-cold
-- phys : Must contain an entry for each entry in phy-names.
-  See ../phy/phy-bindings.txt for details.
-- phy-names : Must include the following entries:
-  - sata-phy : XUSB PADCTL SATA PHY
-- hvdd-supply : Defines the SATA HVDD regulator
-- vddio-supply : Defines the SATA VDDIO regulator
-- avdd-supply : Defines the SATA AVDD regulator
-- target-5v-supply : Defines the SATA 5V power regulator
-- target-12v-supply : Defines the SATA 12V power regulator
diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
new file mode 100644
index 000000000000..c6908e7c42cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
@@ -0,0 +1,44 @@
+* NVIDIA Tegra APB DMA controller
+
+Required properties:
+- compatible: Should be "nvidia,<chip>-apbdma"
+- reg: Should contain DMA registers location and length. This shuld include
+  all of the per-channel registers.
+- interrupts: Should contain all of the per-channel DMA interrupts.
+- clocks: Must contain one entry, for the module clock.
+  See ../clocks/clock-bindings.txt for details.
+- resets : Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names : Must include the following entries:
+  - dma
+- #dma-cells : Must be <1>. This dictates the length of DMA specifiers in
+  client nodes' dmas properties. The specifier represents the DMA request
+  select value for the peripheral. For more details, consult the Tegra TRM's
+  documentation of the APB DMA channel control register REQ_SEL field.
+
+Examples:
+
+apbdma: dma@6000a000 {
+	compatible = "nvidia,tegra20-apbdma";
+	reg = <0x6000a000 0x1200>;
+	interrupts = < 0 136 0x04
+		       0 137 0x04
+		       0 138 0x04
+		       0 139 0x04
+		       0 140 0x04
+		       0 141 0x04
+		       0 142 0x04
+		       0 143 0x04
+		       0 144 0x04
+		       0 145 0x04
+		       0 146 0x04
+		       0 147 0x04
+		       0 148 0x04
+		       0 149 0x04
+		       0 150 0x04
+		       0 151 0x04 >;
+	clocks = <&tegra_car 34>;
+	resets = <&tegra_car 34>;
+	reset-names = "dma";
+	#dma-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt b/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
deleted file mode 100644
index c6908e7c42cc..000000000000
--- a/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* NVIDIA Tegra APB DMA controller
-
-Required properties:
-- compatible: Should be "nvidia,<chip>-apbdma"
-- reg: Should contain DMA registers location and length. This shuld include
-  all of the per-channel registers.
-- interrupts: Should contain all of the per-channel DMA interrupts.
-- clocks: Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - dma
-- #dma-cells : Must be <1>. This dictates the length of DMA specifiers in
-  client nodes' dmas properties. The specifier represents the DMA request
-  select value for the peripheral. For more details, consult the Tegra TRM's
-  documentation of the APB DMA channel control register REQ_SEL field.
-
-Examples:
-
-apbdma: dma@6000a000 {
-	compatible = "nvidia,tegra20-apbdma";
-	reg = <0x6000a000 0x1200>;
-	interrupts = < 0 136 0x04
-		       0 137 0x04
-		       0 138 0x04
-		       0 139 0x04
-		       0 140 0x04
-		       0 141 0x04
-		       0 142 0x04
-		       0 143 0x04
-		       0 144 0x04
-		       0 145 0x04
-		       0 146 0x04
-		       0 147 0x04
-		       0 148 0x04
-		       0 149 0x04
-		       0 150 0x04
-		       0 151 0x04 >;
-	clocks = <&tegra_car 34>;
-	resets = <&tegra_car 34>;
-	reset-names = "dma";
-	#dma-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt
new file mode 100644
index 000000000000..ba0bc3f12419
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-emc.txt
@@ -0,0 +1,374 @@
+NVIDIA Tegra124 SoC EMC (external memory controller)
+====================================================
+
+Required properties :
+- compatible : Should be "nvidia,tegra124-emc".
+- reg : physical base address and length of the controller's registers.
+- nvidia,memory-controller : phandle of the MC driver.
+
+The node should contain a "emc-timings" subnode for each supported RAM type
+(see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
+being its RAM_CODE.
+
+Required properties for "emc-timings" nodes :
+- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
+used for.
+
+Each "emc-timings" node should contain a "timing" subnode for every supported
+EMC clock rate. The "timing" subnodes should have the clock rate in Hz as
+their unit address.
+
+Required properties for "timing" nodes :
+- clock-frequency : Should contain the memory clock rate in Hz.
+- The following properties contain EMC timing characterization values
+(specified in the board documentation) :
+  - nvidia,emc-auto-cal-config : EMC_AUTO_CAL_CONFIG
+  - nvidia,emc-auto-cal-config2 : EMC_AUTO_CAL_CONFIG2
+  - nvidia,emc-auto-cal-config3 : EMC_AUTO_CAL_CONFIG3
+  - nvidia,emc-auto-cal-interval : EMC_AUTO_CAL_INTERVAL
+  - nvidia,emc-bgbias-ctl0 : EMC_BGBIAS_CTL0
+  - nvidia,emc-cfg : EMC_CFG
+  - nvidia,emc-cfg-2 : EMC_CFG_2
+  - nvidia,emc-ctt-term-ctrl : EMC_CTT_TERM_CTRL
+  - nvidia,emc-mode-1 : Mode Register 1
+  - nvidia,emc-mode-2 : Mode Register 2
+  - nvidia,emc-mode-4 : Mode Register 4
+  - nvidia,emc-mode-reset : Mode Register 0
+  - nvidia,emc-mrs-wait-cnt : EMC_MRS_WAIT_CNT
+  - nvidia,emc-sel-dpd-ctrl : EMC_SEL_DPD_CTRL
+  - nvidia,emc-xm2dqspadctrl2 : EMC_XM2DQSPADCTRL2
+  - nvidia,emc-zcal-cnt-long : EMC_ZCAL_WAIT_CNT after clock change
+  - nvidia,emc-zcal-interval : EMC_ZCAL_INTERVAL
+- nvidia,emc-configuration : EMC timing characterization data. These are the
+registers (see section "15.6.2 EMC Registers" in the TRM) whose values need to
+be specified, according to the board documentation:
+
+	EMC_RC
+	EMC_RFC
+	EMC_RFC_SLR
+	EMC_RAS
+	EMC_RP
+	EMC_R2W
+	EMC_W2R
+	EMC_R2P
+	EMC_W2P
+	EMC_RD_RCD
+	EMC_WR_RCD
+	EMC_RRD
+	EMC_REXT
+	EMC_WEXT
+	EMC_WDV
+	EMC_WDV_MASK
+	EMC_QUSE
+	EMC_QUSE_WIDTH
+	EMC_IBDLY
+	EMC_EINPUT
+	EMC_EINPUT_DURATION
+	EMC_PUTERM_EXTRA
+	EMC_PUTERM_WIDTH
+	EMC_PUTERM_ADJ
+	EMC_CDB_CNTL_1
+	EMC_CDB_CNTL_2
+	EMC_CDB_CNTL_3
+	EMC_QRST
+	EMC_QSAFE
+	EMC_RDV
+	EMC_RDV_MASK
+	EMC_REFRESH
+	EMC_BURST_REFRESH_NUM
+	EMC_PRE_REFRESH_REQ_CNT
+	EMC_PDEX2WR
+	EMC_PDEX2RD
+	EMC_PCHG2PDEN
+	EMC_ACT2PDEN
+	EMC_AR2PDEN
+	EMC_RW2PDEN
+	EMC_TXSR
+	EMC_TXSRDLL
+	EMC_TCKE
+	EMC_TCKESR
+	EMC_TPD
+	EMC_TFAW
+	EMC_TRPAB
+	EMC_TCLKSTABLE
+	EMC_TCLKSTOP
+	EMC_TREFBW
+	EMC_FBIO_CFG6
+	EMC_ODT_WRITE
+	EMC_ODT_READ
+	EMC_FBIO_CFG5
+	EMC_CFG_DIG_DLL
+	EMC_CFG_DIG_DLL_PERIOD
+	EMC_DLL_XFORM_DQS0
+	EMC_DLL_XFORM_DQS1
+	EMC_DLL_XFORM_DQS2
+	EMC_DLL_XFORM_DQS3
+	EMC_DLL_XFORM_DQS4
+	EMC_DLL_XFORM_DQS5
+	EMC_DLL_XFORM_DQS6
+	EMC_DLL_XFORM_DQS7
+	EMC_DLL_XFORM_DQS8
+	EMC_DLL_XFORM_DQS9
+	EMC_DLL_XFORM_DQS10
+	EMC_DLL_XFORM_DQS11
+	EMC_DLL_XFORM_DQS12
+	EMC_DLL_XFORM_DQS13
+	EMC_DLL_XFORM_DQS14
+	EMC_DLL_XFORM_DQS15
+	EMC_DLL_XFORM_QUSE0
+	EMC_DLL_XFORM_QUSE1
+	EMC_DLL_XFORM_QUSE2
+	EMC_DLL_XFORM_QUSE3
+	EMC_DLL_XFORM_QUSE4
+	EMC_DLL_XFORM_QUSE5
+	EMC_DLL_XFORM_QUSE6
+	EMC_DLL_XFORM_QUSE7
+	EMC_DLL_XFORM_ADDR0
+	EMC_DLL_XFORM_ADDR1
+	EMC_DLL_XFORM_ADDR2
+	EMC_DLL_XFORM_ADDR3
+	EMC_DLL_XFORM_ADDR4
+	EMC_DLL_XFORM_ADDR5
+	EMC_DLL_XFORM_QUSE8
+	EMC_DLL_XFORM_QUSE9
+	EMC_DLL_XFORM_QUSE10
+	EMC_DLL_XFORM_QUSE11
+	EMC_DLL_XFORM_QUSE12
+	EMC_DLL_XFORM_QUSE13
+	EMC_DLL_XFORM_QUSE14
+	EMC_DLL_XFORM_QUSE15
+	EMC_DLI_TRIM_TXDQS0
+	EMC_DLI_TRIM_TXDQS1
+	EMC_DLI_TRIM_TXDQS2
+	EMC_DLI_TRIM_TXDQS3
+	EMC_DLI_TRIM_TXDQS4
+	EMC_DLI_TRIM_TXDQS5
+	EMC_DLI_TRIM_TXDQS6
+	EMC_DLI_TRIM_TXDQS7
+	EMC_DLI_TRIM_TXDQS8
+	EMC_DLI_TRIM_TXDQS9
+	EMC_DLI_TRIM_TXDQS10
+	EMC_DLI_TRIM_TXDQS11
+	EMC_DLI_TRIM_TXDQS12
+	EMC_DLI_TRIM_TXDQS13
+	EMC_DLI_TRIM_TXDQS14
+	EMC_DLI_TRIM_TXDQS15
+	EMC_DLL_XFORM_DQ0
+	EMC_DLL_XFORM_DQ1
+	EMC_DLL_XFORM_DQ2
+	EMC_DLL_XFORM_DQ3
+	EMC_DLL_XFORM_DQ4
+	EMC_DLL_XFORM_DQ5
+	EMC_DLL_XFORM_DQ6
+	EMC_DLL_XFORM_DQ7
+	EMC_XM2CMDPADCTRL
+	EMC_XM2CMDPADCTRL4
+	EMC_XM2CMDPADCTRL5
+	EMC_XM2DQPADCTRL2
+	EMC_XM2DQPADCTRL3
+	EMC_XM2CLKPADCTRL
+	EMC_XM2CLKPADCTRL2
+	EMC_XM2COMPPADCTRL
+	EMC_XM2VTTGENPADCTRL
+	EMC_XM2VTTGENPADCTRL2
+	EMC_XM2VTTGENPADCTRL3
+	EMC_XM2DQSPADCTRL3
+	EMC_XM2DQSPADCTRL4
+	EMC_XM2DQSPADCTRL5
+	EMC_XM2DQSPADCTRL6
+	EMC_DSR_VTTGEN_DRV
+	EMC_TXDSRVTTGEN
+	EMC_FBIO_SPARE
+	EMC_ZCAL_WAIT_CNT
+	EMC_MRS_WAIT_CNT2
+	EMC_CTT
+	EMC_CTT_DURATION
+	EMC_CFG_PIPE
+	EMC_DYN_SELF_REF_CONTROL
+	EMC_QPOP
+
+Example SoC include file:
+
+/ {
+	emc@7001b000 {
+		compatible = "nvidia,tegra124-emc";
+		reg = <0x0 0x7001b000 0x0 0x1000>;
+
+		nvidia,memory-controller = <&mc>;
+	};
+};
+
+Example board file:
+
+/ {
+	emc@7001b000 {
+		emc-timings-3 {
+			nvidia,ram-code = <3>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 /* EMC_RC */
+					0x00000003 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000060 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000064 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000e0e /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000007 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
deleted file mode 100644
index ba0bc3f12419..000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
+++ /dev/null
@@ -1,374 +0,0 @@
-NVIDIA Tegra124 SoC EMC (external memory controller)
-====================================================
-
-Required properties :
-- compatible : Should be "nvidia,tegra124-emc".
-- reg : physical base address and length of the controller's registers.
-- nvidia,memory-controller : phandle of the MC driver.
-
-The node should contain a "emc-timings" subnode for each supported RAM type
-(see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
-being its RAM_CODE.
-
-Required properties for "emc-timings" nodes :
-- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
-used for.
-
-Each "emc-timings" node should contain a "timing" subnode for every supported
-EMC clock rate. The "timing" subnodes should have the clock rate in Hz as
-their unit address.
-
-Required properties for "timing" nodes :
-- clock-frequency : Should contain the memory clock rate in Hz.
-- The following properties contain EMC timing characterization values
-(specified in the board documentation) :
-  - nvidia,emc-auto-cal-config : EMC_AUTO_CAL_CONFIG
-  - nvidia,emc-auto-cal-config2 : EMC_AUTO_CAL_CONFIG2
-  - nvidia,emc-auto-cal-config3 : EMC_AUTO_CAL_CONFIG3
-  - nvidia,emc-auto-cal-interval : EMC_AUTO_CAL_INTERVAL
-  - nvidia,emc-bgbias-ctl0 : EMC_BGBIAS_CTL0
-  - nvidia,emc-cfg : EMC_CFG
-  - nvidia,emc-cfg-2 : EMC_CFG_2
-  - nvidia,emc-ctt-term-ctrl : EMC_CTT_TERM_CTRL
-  - nvidia,emc-mode-1 : Mode Register 1
-  - nvidia,emc-mode-2 : Mode Register 2
-  - nvidia,emc-mode-4 : Mode Register 4
-  - nvidia,emc-mode-reset : Mode Register 0
-  - nvidia,emc-mrs-wait-cnt : EMC_MRS_WAIT_CNT
-  - nvidia,emc-sel-dpd-ctrl : EMC_SEL_DPD_CTRL
-  - nvidia,emc-xm2dqspadctrl2 : EMC_XM2DQSPADCTRL2
-  - nvidia,emc-zcal-cnt-long : EMC_ZCAL_WAIT_CNT after clock change
-  - nvidia,emc-zcal-interval : EMC_ZCAL_INTERVAL
-- nvidia,emc-configuration : EMC timing characterization data. These are the
-registers (see section "15.6.2 EMC Registers" in the TRM) whose values need to
-be specified, according to the board documentation:
-
-	EMC_RC
-	EMC_RFC
-	EMC_RFC_SLR
-	EMC_RAS
-	EMC_RP
-	EMC_R2W
-	EMC_W2R
-	EMC_R2P
-	EMC_W2P
-	EMC_RD_RCD
-	EMC_WR_RCD
-	EMC_RRD
-	EMC_REXT
-	EMC_WEXT
-	EMC_WDV
-	EMC_WDV_MASK
-	EMC_QUSE
-	EMC_QUSE_WIDTH
-	EMC_IBDLY
-	EMC_EINPUT
-	EMC_EINPUT_DURATION
-	EMC_PUTERM_EXTRA
-	EMC_PUTERM_WIDTH
-	EMC_PUTERM_ADJ
-	EMC_CDB_CNTL_1
-	EMC_CDB_CNTL_2
-	EMC_CDB_CNTL_3
-	EMC_QRST
-	EMC_QSAFE
-	EMC_RDV
-	EMC_RDV_MASK
-	EMC_REFRESH
-	EMC_BURST_REFRESH_NUM
-	EMC_PRE_REFRESH_REQ_CNT
-	EMC_PDEX2WR
-	EMC_PDEX2RD
-	EMC_PCHG2PDEN
-	EMC_ACT2PDEN
-	EMC_AR2PDEN
-	EMC_RW2PDEN
-	EMC_TXSR
-	EMC_TXSRDLL
-	EMC_TCKE
-	EMC_TCKESR
-	EMC_TPD
-	EMC_TFAW
-	EMC_TRPAB
-	EMC_TCLKSTABLE
-	EMC_TCLKSTOP
-	EMC_TREFBW
-	EMC_FBIO_CFG6
-	EMC_ODT_WRITE
-	EMC_ODT_READ
-	EMC_FBIO_CFG5
-	EMC_CFG_DIG_DLL
-	EMC_CFG_DIG_DLL_PERIOD
-	EMC_DLL_XFORM_DQS0
-	EMC_DLL_XFORM_DQS1
-	EMC_DLL_XFORM_DQS2
-	EMC_DLL_XFORM_DQS3
-	EMC_DLL_XFORM_DQS4
-	EMC_DLL_XFORM_DQS5
-	EMC_DLL_XFORM_DQS6
-	EMC_DLL_XFORM_DQS7
-	EMC_DLL_XFORM_DQS8
-	EMC_DLL_XFORM_DQS9
-	EMC_DLL_XFORM_DQS10
-	EMC_DLL_XFORM_DQS11
-	EMC_DLL_XFORM_DQS12
-	EMC_DLL_XFORM_DQS13
-	EMC_DLL_XFORM_DQS14
-	EMC_DLL_XFORM_DQS15
-	EMC_DLL_XFORM_QUSE0
-	EMC_DLL_XFORM_QUSE1
-	EMC_DLL_XFORM_QUSE2
-	EMC_DLL_XFORM_QUSE3
-	EMC_DLL_XFORM_QUSE4
-	EMC_DLL_XFORM_QUSE5
-	EMC_DLL_XFORM_QUSE6
-	EMC_DLL_XFORM_QUSE7
-	EMC_DLL_XFORM_ADDR0
-	EMC_DLL_XFORM_ADDR1
-	EMC_DLL_XFORM_ADDR2
-	EMC_DLL_XFORM_ADDR3
-	EMC_DLL_XFORM_ADDR4
-	EMC_DLL_XFORM_ADDR5
-	EMC_DLL_XFORM_QUSE8
-	EMC_DLL_XFORM_QUSE9
-	EMC_DLL_XFORM_QUSE10
-	EMC_DLL_XFORM_QUSE11
-	EMC_DLL_XFORM_QUSE12
-	EMC_DLL_XFORM_QUSE13
-	EMC_DLL_XFORM_QUSE14
-	EMC_DLL_XFORM_QUSE15
-	EMC_DLI_TRIM_TXDQS0
-	EMC_DLI_TRIM_TXDQS1
-	EMC_DLI_TRIM_TXDQS2
-	EMC_DLI_TRIM_TXDQS3
-	EMC_DLI_TRIM_TXDQS4
-	EMC_DLI_TRIM_TXDQS5
-	EMC_DLI_TRIM_TXDQS6
-	EMC_DLI_TRIM_TXDQS7
-	EMC_DLI_TRIM_TXDQS8
-	EMC_DLI_TRIM_TXDQS9
-	EMC_DLI_TRIM_TXDQS10
-	EMC_DLI_TRIM_TXDQS11
-	EMC_DLI_TRIM_TXDQS12
-	EMC_DLI_TRIM_TXDQS13
-	EMC_DLI_TRIM_TXDQS14
-	EMC_DLI_TRIM_TXDQS15
-	EMC_DLL_XFORM_DQ0
-	EMC_DLL_XFORM_DQ1
-	EMC_DLL_XFORM_DQ2
-	EMC_DLL_XFORM_DQ3
-	EMC_DLL_XFORM_DQ4
-	EMC_DLL_XFORM_DQ5
-	EMC_DLL_XFORM_DQ6
-	EMC_DLL_XFORM_DQ7
-	EMC_XM2CMDPADCTRL
-	EMC_XM2CMDPADCTRL4
-	EMC_XM2CMDPADCTRL5
-	EMC_XM2DQPADCTRL2
-	EMC_XM2DQPADCTRL3
-	EMC_XM2CLKPADCTRL
-	EMC_XM2CLKPADCTRL2
-	EMC_XM2COMPPADCTRL
-	EMC_XM2VTTGENPADCTRL
-	EMC_XM2VTTGENPADCTRL2
-	EMC_XM2VTTGENPADCTRL3
-	EMC_XM2DQSPADCTRL3
-	EMC_XM2DQSPADCTRL4
-	EMC_XM2DQSPADCTRL5
-	EMC_XM2DQSPADCTRL6
-	EMC_DSR_VTTGEN_DRV
-	EMC_TXDSRVTTGEN
-	EMC_FBIO_SPARE
-	EMC_ZCAL_WAIT_CNT
-	EMC_MRS_WAIT_CNT2
-	EMC_CTT
-	EMC_CTT_DURATION
-	EMC_CFG_PIPE
-	EMC_DYN_SELF_REF_CONTROL
-	EMC_QPOP
-
-Example SoC include file:
-
-/ {
-	emc@7001b000 {
-		compatible = "nvidia,tegra124-emc";
-		reg = <0x0 0x7001b000 0x0 0x1000>;
-
-		nvidia,memory-controller = <&mc>;
-	};
-};
-
-Example board file:
-
-/ {
-	emc@7001b000 {
-		emc-timings-3 {
-			nvidia,ram-code = <3>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-
-				nvidia,emc-zcal-cnt-long = <0x00000042>;
-				nvidia,emc-auto-cal-interval = <0x001fffff>;
-				nvidia,emc-ctt-term-ctrl = <0x00000802>;
-				nvidia,emc-cfg = <0x73240000>;
-				nvidia,emc-cfg-2 = <0x000008c5>;
-				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
-				nvidia,emc-bgbias-ctl0 = <0x00000008>;
-				nvidia,emc-auto-cal-config = <0xa1430000>;
-				nvidia,emc-auto-cal-config2 = <0x00000000>;
-				nvidia,emc-auto-cal-config3 = <0x00000000>;
-				nvidia,emc-mode-reset = <0x80001221>;
-				nvidia,emc-mode-1 = <0x80100003>;
-				nvidia,emc-mode-2 = <0x80200008>;
-				nvidia,emc-mode-4 = <0x00000000>;
-
-				nvidia,emc-configuration = <
-					0x00000000 /* EMC_RC */
-					0x00000003 /* EMC_RFC */
-					0x00000000 /* EMC_RFC_SLR */
-					0x00000000 /* EMC_RAS */
-					0x00000000 /* EMC_RP */
-					0x00000004 /* EMC_R2W */
-					0x0000000a /* EMC_W2R */
-					0x00000003 /* EMC_R2P */
-					0x0000000b /* EMC_W2P */
-					0x00000000 /* EMC_RD_RCD */
-					0x00000000 /* EMC_WR_RCD */
-					0x00000003 /* EMC_RRD */
-					0x00000003 /* EMC_REXT */
-					0x00000000 /* EMC_WEXT */
-					0x00000006 /* EMC_WDV */
-					0x00000006 /* EMC_WDV_MASK */
-					0x00000006 /* EMC_QUSE */
-					0x00000002 /* EMC_QUSE_WIDTH */
-					0x00000000 /* EMC_IBDLY */
-					0x00000005 /* EMC_EINPUT */
-					0x00000005 /* EMC_EINPUT_DURATION */
-					0x00010000 /* EMC_PUTERM_EXTRA */
-					0x00000003 /* EMC_PUTERM_WIDTH */
-					0x00000000 /* EMC_PUTERM_ADJ */
-					0x00000000 /* EMC_CDB_CNTL_1 */
-					0x00000000 /* EMC_CDB_CNTL_2 */
-					0x00000000 /* EMC_CDB_CNTL_3 */
-					0x00000004 /* EMC_QRST */
-					0x0000000c /* EMC_QSAFE */
-					0x0000000d /* EMC_RDV */
-					0x0000000f /* EMC_RDV_MASK */
-					0x00000060 /* EMC_REFRESH */
-					0x00000000 /* EMC_BURST_REFRESH_NUM */
-					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
-					0x00000002 /* EMC_PDEX2WR */
-					0x00000002 /* EMC_PDEX2RD */
-					0x00000001 /* EMC_PCHG2PDEN */
-					0x00000000 /* EMC_ACT2PDEN */
-					0x00000007 /* EMC_AR2PDEN */
-					0x0000000f /* EMC_RW2PDEN */
-					0x00000005 /* EMC_TXSR */
-					0x00000005 /* EMC_TXSRDLL */
-					0x00000004 /* EMC_TCKE */
-					0x00000005 /* EMC_TCKESR */
-					0x00000004 /* EMC_TPD */
-					0x00000000 /* EMC_TFAW */
-					0x00000000 /* EMC_TRPAB */
-					0x00000005 /* EMC_TCLKSTABLE */
-					0x00000005 /* EMC_TCLKSTOP */
-					0x00000064 /* EMC_TREFBW */
-					0x00000000 /* EMC_FBIO_CFG6 */
-					0x00000000 /* EMC_ODT_WRITE */
-					0x00000000 /* EMC_ODT_READ */
-					0x106aa298 /* EMC_FBIO_CFG5 */
-					0x002c00a0 /* EMC_CFG_DIG_DLL */
-					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
-					0x00064000 /* EMC_DLL_XFORM_DQS0 */
-					0x00064000 /* EMC_DLL_XFORM_DQS1 */
-					0x00064000 /* EMC_DLL_XFORM_DQS2 */
-					0x00064000 /* EMC_DLL_XFORM_DQS3 */
-					0x00064000 /* EMC_DLL_XFORM_DQS4 */
-					0x00064000 /* EMC_DLL_XFORM_DQS5 */
-					0x00064000 /* EMC_DLL_XFORM_DQS6 */
-					0x00064000 /* EMC_DLL_XFORM_DQS7 */
-					0x00064000 /* EMC_DLL_XFORM_DQS8 */
-					0x00064000 /* EMC_DLL_XFORM_DQS9 */
-					0x00064000 /* EMC_DLL_XFORM_DQS10 */
-					0x00064000 /* EMC_DLL_XFORM_DQS11 */
-					0x00064000 /* EMC_DLL_XFORM_DQS12 */
-					0x00064000 /* EMC_DLL_XFORM_DQS13 */
-					0x00064000 /* EMC_DLL_XFORM_DQS14 */
-					0x00064000 /* EMC_DLL_XFORM_DQS15 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
-					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
-					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
-					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
-					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
-					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
-					0x10000280 /* EMC_XM2CMDPADCTRL */
-					0x00000000 /* EMC_XM2CMDPADCTRL4 */
-					0x00111111 /* EMC_XM2CMDPADCTRL5 */
-					0x00000000 /* EMC_XM2DQPADCTRL2 */
-					0x00000000 /* EMC_XM2DQPADCTRL3 */
-					0x77ffc081 /* EMC_XM2CLKPADCTRL */
-					0x00000e0e /* EMC_XM2CLKPADCTRL2 */
-					0x81f1f108 /* EMC_XM2COMPPADCTRL */
-					0x07070004 /* EMC_XM2VTTGENPADCTRL */
-					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
-					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
-					0x51451400 /* EMC_XM2DQSPADCTRL3 */
-					0x00514514 /* EMC_XM2DQSPADCTRL4 */
-					0x00514514 /* EMC_XM2DQSPADCTRL5 */
-					0x51451400 /* EMC_XM2DQSPADCTRL6 */
-					0x0000003f /* EMC_DSR_VTTGEN_DRV */
-					0x00000007 /* EMC_TXDSRVTTGEN */
-					0x00000000 /* EMC_FBIO_SPARE */
-					0x00000042 /* EMC_ZCAL_WAIT_CNT */
-					0x000e000e /* EMC_MRS_WAIT_CNT2 */
-					0x00000000 /* EMC_CTT */
-					0x00000003 /* EMC_CTT_DURATION */
-					0x0000f2f3 /* EMC_CFG_PIPE */
-					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
-					0x0000000a /* EMC_QPOP */
-				>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
new file mode 100644
index 000000000000..edebfa0a985e
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra-soctherm.txt
@@ -0,0 +1,67 @@
+Tegra124 SOCTHERM thermal management system
+
+The SOCTHERM IP block contains thermal sensors, support for polled
+or interrupt-based thermal monitoring, CPU and GPU throttling based
+on temperature trip points, and handling external overcurrent
+notifications. It is also used to manage emergency shutdown in an
+overheating situation.
+
+Required properties :
+- compatible : For Tegra124, must contain "nvidia,tegra124-soctherm".
+  For Tegra132, must contain "nvidia,tegra132-soctherm".
+  For Tegra210, must contain "nvidia,tegra210-soctherm".
+- reg : Should contain 1 entry:
+  - SOCTHERM register set
+- interrupts : Defines the interrupt used by SOCTHERM
+- clocks : Must contain an entry for each entry in clock-names.
+  See ../clocks/clock-bindings.txt for details.
+- clock-names : Must include the following entries:
+  - tsensor
+  - soctherm
+- resets : Must contain an entry for each entry in reset-names.
+  See ../reset/reset.txt for details.
+- reset-names : Must include the following entries:
+  - soctherm
+- #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description
+    of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
+    list of valid values when referring to thermal sensors.
+
+Note:
+- the "critical" type trip points will be set to SOC_THERM hardware as the
+shut down temperature. Once the temperature of this thermal zone is higher
+than it, the system will be shutdown or reset by hardware.
+
+Example :
+
+	soctherm@700e2000 {
+		compatible = "nvidia,tegra124-soctherm";
+		reg = <0x0 0x700e2000 0x0 0x1000>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
+			<&tegra_car TEGRA124_CLK_SOC_THERM>;
+		clock-names = "tsensor", "soctherm";
+		resets = <&tegra_car 78>;
+		reset-names = "soctherm";
+
+		#thermal-sensor-cells = <1>;
+	};
+
+Example: referring to thermal sensors :
+
+       thermal-zones {
+                cpu {
+                        polling-delay-passive = <1000>;
+                        polling-delay = <1000>;
+
+                        thermal-sensors =
+                                <&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
+
+			trips {
+				cpu_shutdown_trip: shutdown-trip {
+					temperature = <102500>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+                };
+	};
diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
deleted file mode 100644
index edebfa0a985e..000000000000
--- a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Tegra124 SOCTHERM thermal management system
-
-The SOCTHERM IP block contains thermal sensors, support for polled
-or interrupt-based thermal monitoring, CPU and GPU throttling based
-on temperature trip points, and handling external overcurrent
-notifications. It is also used to manage emergency shutdown in an
-overheating situation.
-
-Required properties :
-- compatible : For Tegra124, must contain "nvidia,tegra124-soctherm".
-  For Tegra132, must contain "nvidia,tegra132-soctherm".
-  For Tegra210, must contain "nvidia,tegra210-soctherm".
-- reg : Should contain 1 entry:
-  - SOCTHERM register set
-- interrupts : Defines the interrupt used by SOCTHERM
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - tsensor
-  - soctherm
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - soctherm
-- #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description
-    of this property. See <dt-bindings/thermal/tegra124-soctherm.h> for a
-    list of valid values when referring to thermal sensors.
-
-Note:
-- the "critical" type trip points will be set to SOC_THERM hardware as the
-shut down temperature. Once the temperature of this thermal zone is higher
-than it, the system will be shutdown or reset by hardware.
-
-Example :
-
-	soctherm@700e2000 {
-		compatible = "nvidia,tegra124-soctherm";
-		reg = <0x0 0x700e2000 0x0 0x1000>;
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
-			<&tegra_car TEGRA124_CLK_SOC_THERM>;
-		clock-names = "tsensor", "soctherm";
-		resets = <&tegra_car 78>;
-		reset-names = "soctherm";
-
-		#thermal-sensor-cells = <1>;
-	};
-
-Example: referring to thermal sensors :
-
-       thermal-zones {
-                cpu {
-                        polling-delay-passive = <1000>;
-                        polling-delay = <1000>;
-
-                        thermal-sensors =
-                                <&soctherm TEGRA124_SOCTHERM_SENSOR_CPU>;
-
-			trips {
-				cpu_shutdown_trip: shutdown-trip {
-					temperature = <102500>;
-					hysteresis = <1000>;
-					type = "critical";
-				};
-			};
-                };
-	};
-- 
2.8.0
