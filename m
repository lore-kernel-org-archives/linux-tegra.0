From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: bus: Add documentation for Tegra210 ACONNECT
Date: Fri, 29 Apr 2016 14:53:45 +0100
Message-ID: <1461938027-23034-2-git-send-email-jonathanh@nvidia.com>
References: <1461938027-23034-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461938027-23034-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add binding documentation for the Tegra ACONNECT bus that is part of the
Audio Processing Engine (APE) on Tegra210. The ACONNECT bus is used to
access devices within the APE subsystem. The APE is located in a
separate power domain and so accesses made to the ACONNECT require the
power domain to be enabled as well as some platform specific clocks.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/bus/nvidia,tegra210-aconnect.txt      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
new file mode 100644
index 000000000000..e5e915f8fca7
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
+  in the host1x address space. Should be 2.
+- #size-cells: The number of cells used to represent the size of an address
+  range in the host1x address space. Should be 2.
+- ranges: 1:1 mapping of the aconnect address space to the CPU address space.
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
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x702c0000 0x0 0x702c0000 0x0 0x00040000>;
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
