From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Tue, 19 Jul 2016 15:36:34 +0200
Message-ID: <1468935397-11926-4-git-send-email-mirza.krak@gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468935397-11926-1-git-send-email-mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Document the devicetree bindings for NOR bus driver found on Tegra20 and
Tegra30 SOCs

Signed-off-by: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/bus/nvidia,tegra20-nor.txt | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt

diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
new file mode 100644
index 0000000..9ee4a66
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-nor.txt
@@ -0,0 +1,73 @@
+Device tree bindings for NVIDIA Tegra20/30 NOR Bus
+
+The NOR controller supports a number of memory types, including synchronous NOR,
+asynchronous NOR, and other flash memories with similar interfaces, such as
+MuxOneNAND. One could also connect high speed devices like FPGAs, DSPs,
+CAN chips, Wi-Fi chips etc.
+
+The actual devices are instantiated from the child nodes of a NOR node.
+
+Required properties:
+
+ - compatible: should be "nvidia,tegra20-nor", "nvidia,tegra30-nor"
+ - reg: Should contain NOR controller registers location and length.
+ - clocks: Must contain one entry, for the module clock.
+   See ../clocks/clock-bindings.txt for details.
+ - resets : Must contain an entry for each entry in reset-names.
+   See ../reset/reset.txt for details.
+ - reset-names : Must include the following entries:
+  - nor
+ - #address-cells: Must be set to 2 to allow memory address translation
+ - #size-cells:	Must be set to 1 to allow CS address passing
+ - ranges: Must be set up to reflect the memory layout with four integer
+ 		values for each chip-select line in use.
+ - nvidia,config: This property represents the SNOR_CONFIG_0 register.
+
+Note that the NOR controller does not have any internal chip-select address
+decoding and if you want to access multiple devices external chip-select
+decoding must be provided.
+
+Optional properties:
+
+ - nvidia,cs-timing: The timing array represents the SNOR_TIMING0_0 and
+   SNOR_TIMING1_0 registers for the NOR controller. If unset reset-values will
+   be used. See reference documentation for detailed description of the timing
+   registers.
+
+Example with two SJA1000 CAN controllers connected to the NOR bus:
+
+	nor@70009000 {
+		status = "okay";
+		compatible = "nvidia,tegra20-nor", "nvidia,tegra30-nor";
+		reg = <0x70009000 0x1000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		clocks = <&tegra_car TEGRA30_CLK_NOR>;
+		resets = < &tegra_car 42>;
+		reset-names = "nor";
+		ranges = <
+			0 0 0x48000000 0x00000100
+			1 0 0x48040000 0x00000100
+		>;
+
+		can@0,0 {
+			compatible = "nxp,sja1000";
+			reg = <0 0 0x100>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(B, 5) IRQ_TYPE_EDGE_RISING>;
+			nxp,external-clock-frequency = <24000000>;
+			nxp,tx-output-config = <0x16>;
+			nxp,clock-out-frequency = <24000000>;
+			reg-io-width = <2>;
+		};
+
+
+		can@1,0 {
+			compatible = "nxp,sja1000";
+			reg = <1 0 0x100>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(A, 6) IRQ_TYPE_EDGE_RISING>;
+			nxp,external-clock-frequency = <24000000>;
+			nxp,tx-output-config = <0x16>;
+			reg-io-width = <2>;
+	};
-- 
2.1.4
