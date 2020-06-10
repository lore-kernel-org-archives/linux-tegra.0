From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI port nodes
Date: Tue, 9 Jun 2020 23:02:32 -0700
Message-ID: <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1591768960-31648-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch documents Tegra VI and CSI port and endpoint nodes along
with the other required properties.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 4731921..f70a838 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -65,6 +65,48 @@ of the following host1x client modules:
       - power-domains: Must include sor powergate node as csicil is in
         SOR partition.
 
+      Optional properties for csi node:
+
+      - channel nodes: Max upto 6 channels/streams are supported with each CSI
+	brick can as either x4 or x2 based on hw connectivity to sensor.
+
+	Required properties:
+	- reg: channel/stream index
+	- nvidia,mipi-calibrate: Should contain a phandle and a specifier
+	  specifying which pads are used by this CSI port and need to be
+	  calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+	- port: CSI port node and its endpoint nodes as per device graph
+          bindings defined in Documentation/devicetree/bindings/graph.txt.
+	  Required properties:
+	  - reg: csi port index based on hw csi lanes connectivity to the
+	    sensor.
+	  - bus-width: number of lanes used by this port. Supported lanes
+	    are 1/2/4.
+	  - endpoint@0: sink node
+	    Required properties:
+	    - reg: endpoint id. This is used to retrieve pad for creating
+	      media link
+	    - remote-endpoint: phandle to sensor endpoint
+	  - endpoint@1: source node
+	    - reg: endpoint id. This is used to retrieve pad for creating
+	      media link
+	    - remote-endpoint: phandle to vi port endpoint
+
+  Optional properties for vi node:
+  - ports: Video port nodes and endpoint nodes as per device graph bindings
+    defined in Documentation/devicetree/bindings/graph.txt
+    Max 6 ports are supported and each port should have one endpoint node.
+
+    Required properties:
+    - port: VI port node and its sink endpoint node
+      Required properties:
+    - reg: should match port index
+    - endpoint@0: sink node
+      Required properties:
+      - reg: endpoint id must be 0
+      - remote-endpoint: phandle to CSI endpoint node.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -340,6 +382,22 @@ Example:
 
 			ranges = <0x0 0x0 0x54080000 0x2000>;
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					imx219_vi_in0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&imx219_csi_out0>;
+					};
+				};
+			};
+
 			csi@838 {
 				compatible = "nvidia,tegra210-csi";
 				reg = <0x838 0x1300>;
@@ -362,6 +420,35 @@ Example:
 					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
 				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
 				power-domains = <&pd_sor>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				channel@0 {
+					reg = <0>;
+					nvidia,mipi-calibrate = <&mipi 0x001>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						bus-width = <2>;
+
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						imx219_csi_in0: endpoint@0 {
+							reg = <0>;
+							remote-endpoint = <&imx219_out0>;
+						};
+
+						imx219_csi_out0: endpoint@1 {
+							reg = <1>;
+							remote-endpoint = <&imx219_vi_in0>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.7.4
