From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/4] dt/bindings: fix binding examples for tegra gmi controller
Date: Sat, 10 Feb 2018 02:33:22 +0100
Message-ID: <20180210013326.27771-2-marcel@ziswiler.com>
References: <20180210013326.27771-1-marcel@ziswiler.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180210013326.27771-1-marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

Fix devicetree binding examples for the Generic Memory Interface (GMI)
bus driver found on Tegra SOCs.

While at it also remove double new lines as a left over from Rob's
commit 4da722ca19f3 ("dt-bindings: Remove "status" from examples").

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
---

 Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
index 3e21eb822811..c1e70621799b 100644
--- a/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
@@ -73,7 +73,7 @@ Example with two SJA1000 CAN controllers connected to the GMI bus. We wrap the
 controllers with a simple-bus node since they are all connected to the same
 chip-select (CS4), in this example external address decoding is provided:
 
-gmi@70090000 {
+gmi@70009000 {
 	compatible = "nvidia,tegra20-gmi";
 	reg = <0x70009000 0x1000>;
 	#address-cells = <2>;
@@ -84,7 +84,6 @@ gmi@70090000 {
 	reset-names = "gmi";
 	ranges = <4 0 0xd0000000 0xfffffff>;
 
-
 	bus@4,0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -109,7 +108,7 @@ gmi@70090000 {
 Example with one SJA1000 CAN controller connected to the GMI bus
 on CS4:
 
-gmi@70090000 {
+gmi@70009000 {
 	compatible = "nvidia,tegra20-gmi";
 	reg = <0x70009000 0x1000>;
 	#address-cells = <2>;
@@ -120,7 +119,6 @@ gmi@70090000 {
 	reset-names = "gmi";
 	ranges = <4 0 0xd0000000 0xfffffff>;
 
-
 	can@4,0 {
 		reg = <4 0 0x100>;
 		nvidia,snor-mux-mode;
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
