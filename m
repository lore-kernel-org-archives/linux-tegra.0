From: <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3 v2] dt: tegra20: Add ehci host controller nodes.
Date: Wed, 20 Jul 2011 12:38:09 -0700
Message-ID: <1311190690-18334-2-git-send-email-achew@nvidia.com>
References: <1311190690-18334-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311190690-18334-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dwillemsen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mogantyv-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These values were derived from various headers in arch/arm/mach-tegra.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |   43 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 83fedf3..d4ab1ab 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -160,5 +160,48 @@
 		interrupts = < 63 >;
 		status = "disabled";
 	};
+
+	ehci@c5000000 {
+		compatible = "nvidia,tegra20-ehci";
+		reg = <0xc5000000 0x4000>;
+		interrupts = < 52 >;
+		mode = "host";
+		power_down_on_bus_suspend = < 1 >;
+		type = "utmi";
+		hssync_start_delay = < 9 >;
+		idle_wait_delay = < 17 >;
+		elastic_limit = < 16 >;
+		term_range_adj = < 6 >;
+		xcvr_setup = < 9 >;
+		xcvr_lsfslew = < 1 >;
+		xcvr_lsrslew = < 1 >;
+	};
+
+	ehci@c5004000 {
+		compatible = "nvidia,tegra20-ehci";
+		reg = <0xc5004000 0x4000>;
+		interrupts = < 53 >;
+		mode = "host";
+		power_down_on_bus_suspend = < 1 >;
+		type = "ulpi";
+		reset_gpio = < 169 >;
+		clk = "cdev2";
+	};
+
+	ehci@c5008000 {
+		compatible = "nvidia,tegra20-ehci";
+		reg = <0xc5008000 0x4000>;
+		interrupts = < 129 >;
+		mode = "host";
+		power_down_on_bus_suspend = < 1 >;
+		type = "utmi";
+		hssync_start_delay = < 9 >;
+		idle_wait_delay = < 17 >;
+		elastic_limit = < 16 >;
+		term_range_adj = < 6 >;
+		xcvr_setup = < 9 >;
+		xcvr_lsfslew = < 2 >;
+		xcvr_lsrslew = < 2 >;
+	};
 };
 
-- 
1.7.6
