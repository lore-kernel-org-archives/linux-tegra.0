From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/4] dt-bindings: bus: Add documentation for Tegra210 ACONNECT
Date: Tue, 10 May 2016 12:35:37 +0100
Message-ID: <1462880140-5938-2-git-send-email-jonathanh@nvidia.com>
References: <1462880140-5938-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462880140-5938-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add binding documentation for the Tegra ACONNECT bus that is part of the
Audio Processing Engine (APE) on Tegra210. The ACONNECT bus is used to
access devices within the APE subsystem. The APE is located in a
separate power domain and so accesses made to the ACONNECT require the
power domain to be enabled as well as some platform specific clocks.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../bindings/bus/nvidia,tegra210-aconnect.txt      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
new file mode 100644
index 000000000000..81668f588eca
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
@@ -0,0 +1,45 @@
+NVIDIA Tegra ACONNECT Bus
+
+The Tegra ACONNECT bus is an AXI switch which is used to connnect various
+components inside the Audio Processing Engine (APE). All CPU accesses to
+the APE subsystem go through the ACONNECT via an APB to AXI wrapper.
+
+Required properties:
+- compatible: Must be "nvidia,tegra210-aconnect".
+- clocks: Must contain the entries for the APE clock (TEGRA210_CLK_APE),
+  and APE interface clock (TEGRA210_CLK_APB2APE).
+- clock-names: Must contain the names "ape" and "apb2ape" for the corresponding
+  'clocks' entries.
+- power-domains: Must contain a phandle that points to the audio powergate
+  (namely 'aud') for Tegra210.
+- #address-cells: The number of cells used to represent physical base addresses
+  in the aconnect address space. Should be 2.
+- #size-cells: The number of cells used to represent the size of an address
+  range in the aconnect address space. Should be 2.
+- ranges: Mapping of the aconnect address space to the CPU address space.
+
+All devices accessed via the ACONNNECT are described by child-nodes.
+
+Example:
+
+	aconnect@702c0000 {
+		compatible = "nvidia,tegra210-aconnect";
+		clocks = <&tegra_car TEGRA210_CLK_APE>,
+			 <&tegra_car TEGRA210_CLK_APB2APE>;
+		clock-names = "ape", "apb2ape";
+		power-domains = <&pd_audio>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
+
+		status = "disabled";
+
+		child1 {
+			...
+		};
+
+		child2 {
+			...
+		};
+	};
-- 
2.1.4
