From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 4/6] ARM: tegra: add Venice2 board support
Date: Tue, 8 Oct 2013 12:50:06 +0800
Message-ID: <1381207808-14734-5-git-send-email-josephl@nvidia.com>
References: <1381207808-14734-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381207808-14734-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the Tegra124 based Venice2 reference board.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* fix the device node name with register address
* remove an extra blank line
---
 arch/arm/boot/dts/Makefile             |  3 ++-
 arch/arm/boot/dts/tegra124-venice2.dts | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra124-venice2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index cf75889..1c3b871 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -252,7 +252,8 @@ dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
-	tegra114-dalmore.dtb
+	tegra114-dalmore.dtb \
+	tegra124-venice2.dtb
 dtb-$(CONFIG_ARCH_VERSATILE) += versatile-ab.dtb \
 	versatile-pb.dtb
 dtb-$(CONFIG_ARCH_U300) += ste-u300.dtb
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
new file mode 100644
index 0000000..2bfc7ab
--- /dev/null
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -0,0 +1,20 @@
+/dts-v1/;
+
+#include "tegra124.dtsi"
+
+/ {
+	model = "NVIDIA Tegra124 Venice2";
+	compatible = "nvidia,venice2", "nvidia,tegra124";
+
+	memory {
+		reg = <0x80000000 0x80000000>;
+	};
+
+	serial@70006000 {
+		status = "okay";
+	};
+
+	pmc@7000e400 {
+		nvidia,invert-interrupt;
+	};
+};
-- 
1.8.4
