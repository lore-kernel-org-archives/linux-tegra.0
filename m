From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [v2 8/9] ARM: dt: tegra114: Add new board, Pluto
Date: Tue, 8 Jan 2013 14:47:42 +0200
Message-ID: <1357649263-1098-9-git-send-email-hdoyu@nvidia.com>
References: <1357649263-1098-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357649263-1098-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new evaluation board, Pluto for Tegra 114 family.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile           |    3 ++-
 arch/arm/boot/dts/tegra114-pluto.dts |   21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra114-pluto.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 88ea9fc..b53f18f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -144,7 +144,8 @@ dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra20-whistler.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
-	tegra114-dalmore.dtb
+	tegra114-dalmore.dtb \
+	tegra114-pluto.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2p-ca5s.dtb \
 	vexpress-v2p-ca9.dtb \
 	vexpress-v2p-ca15-tc1.dtb \
diff --git a/arch/arm/boot/dts/tegra114-pluto.dts b/arch/arm/boot/dts/tegra114-pluto.dts
new file mode 100644
index 0000000..9bea8f5
--- /dev/null
+++ b/arch/arm/boot/dts/tegra114-pluto.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/include/ "tegra114.dtsi"
+
+/ {
+	model = "NVIDIA Tegra114 Pluto evaluation board";
+	compatible = "nvidia,pluto", "nvidia,tegra114";
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+
+	serial@70006300 {
+		status = "okay";
+		clock-frequency = <408000000>;
+	};
+
+	pmc {
+		nvidia,invert-interrupt;
+	};
+};
-- 
1.7.9.5
