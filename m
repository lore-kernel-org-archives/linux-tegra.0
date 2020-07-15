From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v3 11/18] dt-bindings: tegra: Update VI and CSI bindings with port info
Date: Tue, 14 Jul 2020 21:20:48 -0700
Message-ID: <1594786855-26506-12-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Update VI and CSI bindings to add port and endpoint nodes as per
media video-interfaces DT binding document.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 92 +++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 4731921..ac63ae4a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -51,8 +51,16 @@ of the following host1x client modules:
       - vi
   - Tegra210:
     - power-domains: Must include venc powergate node as vi is in VE partition.
-  - Tegra210 has CSI part of VI sharing same host interface and register space.
-    So, VI device node should have CSI child node.
+
+  ports (optional node)
+  vi can have optional ports node and max 6 ports are supported. Each port
+  should have single 'endpoint' child node. All port nodes are grouped under
+  ports node. Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  csi (required node)
+  Tegra210 has CSI part of VI sharing same host interface and register space.
+  So, VI device node should have CSI child node.
 
     - csi: mipi csi interface to vi
 
@@ -65,6 +73,46 @@ of the following host1x client modules:
       - power-domains: Must include sor powergate node as csicil is in
         SOR partition.
 
+      channel (optional nodes)
+      Maximum 6 channels are supported with each csi brick as either x4 or x2
+      based on hw connectivity to sensor.
+
+      Required properties:
+      - reg: csi port number. Valid port numbers are 0 through 5.
+      - nvidia,mipi-calibrate: Should contain a phandle and a specifier
+        specifying which pads are used by this CSI port and need to be
+	calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+      Each channel node must contain 2 port nodes which can be grouped
+      under 'ports' node and each port should have a single child 'endpoint'
+      node.
+
+        ports node
+        Please refer to the bindings defined in
+        Documentation/devicetree/bindings/media/video-interfaces.txt
+
+        ports node must contain below 2 port nodes.
+        port@0 with single child 'endpoint' node always a sink.
+        port@1 with single child 'endpoint' node always a source.
+
+        port@0 (required node)
+        Required properties:
+        - reg: 0
+
+	  endpoint (required node)
+	  Required properties:
+	  - data-lanes: an array of data lane from 1 to 4. Valid array
+	    lengths are 1/2/4.
+	  - remote-endpoint: phandle to sensor 'endpoint' node.
+
+        port@1 (required node)
+        Required properties:
+        - reg: 1
+
+	  endpoint (required node)
+	  Required properties:
+	  - remote-endpoint: phandle to vi port 'endpoint' node.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -340,6 +388,18 @@ Example:
 
 			ranges = <0x0 0x0 0x54080000 0x2000>;
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					imx219_vi_in0: endpoint {
+						remote-endpoint = <&imx219_csi_out0>;
+					};
+				};
+			};
+
 			csi@838 {
 				compatible = "nvidia,tegra210-csi";
 				reg = <0x838 0x1300>;
@@ -362,6 +422,34 @@ Example:
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
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							imx219_csi_in0: endpoint {
+								data-lanes = <1 2>;
+								remote-endpoint = <&imx219_out0>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							imx219_csi_out0: endpoint {
+								remote-endpoint = <&imx219_vi_in0>;
+							};
+						};
+					};
+				};
 			};
 		};
 
-- 
2.7.4
