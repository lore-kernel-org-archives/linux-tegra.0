From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 05/20] tegra: fdt: Add Tegra2x device tree file
	from kernel
Date: Mon, 27 Feb 2012 12:52:38 -0800
Message-ID: <1330375973-10681-6-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This was taken from commit b48c54e2 at:
git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git

config.mk is updated to provide this file to boards through the
built-in mechanism:

/include/ ARCH_CPU_DTS

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 arch/arm/cpu/armv7/tegra2/config.mk |    2 +
 arch/arm/dts/tegra20.dtsi           |  168 +++++++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/dts/tegra20.dtsi

diff --git a/arch/arm/cpu/armv7/tegra2/config.mk b/arch/arm/cpu/armv7/tegra2/config.mk
index 2303dba..fe9ef5b 100644
--- a/arch/arm/cpu/armv7/tegra2/config.mk
+++ b/arch/arm/cpu/armv7/tegra2/config.mk
@@ -31,3 +31,5 @@ CFLAGS_arch/arm/lib/board.o += -march=armv4t
 endif
 
 USE_PRIVATE_LIBGCC = yes
+
+CONFIG_ARCH_DEVICE_TREE := tegra20
diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
new file mode 100644
index 0000000..a9a98ea
--- /dev/null
+++ b/arch/arm/dts/tegra20.dtsi
@@ -0,0 +1,168 @@
+/include/ "skeleton.dtsi"
+
+/ {
+	compatible = "nvidia,tegra20";
+	interrupt-parent = <&intc>;
+
+	intc: interrupt-controller@50041000 {
+		compatible = "nvidia,tegra20-gic";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = < 0x50041000 0x1000 >,
+		      < 0x50040100 0x0100 >;
+	};
+
+	i2c@7000c000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000C000 0x100>;
+		interrupts = < 70 >;
+	};
+
+	i2c@7000c400 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000C400 0x100>;
+		interrupts = < 116 >;
+	};
+
+	i2c@7000c500 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000C500 0x100>;
+		interrupts = < 124 >;
+	};
+
+	i2c@7000d000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2c";
+		reg = <0x7000D000 0x200>;
+		interrupts = < 85 >;
+	};
+
+	i2s@70002800 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2s";
+		reg = <0x70002800 0x200>;
+		interrupts = < 45 >;
+		dma-channel = < 2 >;
+	};
+
+	i2s@70002a00 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-i2s";
+		reg = <0x70002a00 0x200>;
+		interrupts = < 35 >;
+		dma-channel = < 1 >;
+	};
+
+	das@70000c00 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "nvidia,tegra20-das";
+		reg = <0x70000c00 0x80>;
+	};
+
+	gpio: gpio@6000d000 {
+		compatible = "nvidia,tegra20-gpio";
+		reg = < 0x6000d000 0x1000 >;
+		interrupts = < 64 65 66 67 87 119 121 >;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	pinmux: pinmux@70000000 {
+		compatible = "nvidia,tegra20-pinmux";
+		reg = < 0x70000014 0x10    /* Tri-state registers */
+			0x70000080 0x20    /* Mux registers */
+			0x700000a0 0x14    /* Pull-up/down registers */
+			0x70000868 0xa8 >; /* Pad control registers */
+	};
+
+	serial@70006000 {
+		compatible = "nvidia,tegra20-uart";
+		reg = <0x70006000 0x40>;
+		reg-shift = <2>;
+		interrupts = < 68 >;
+	};
+
+	serial@70006040 {
+		compatible = "nvidia,tegra20-uart";
+		reg = <0x70006040 0x40>;
+		reg-shift = <2>;
+		interrupts = < 69 >;
+	};
+
+	serial@70006200 {
+		compatible = "nvidia,tegra20-uart";
+		reg = <0x70006200 0x100>;
+		reg-shift = <2>;
+		interrupts = < 78 >;
+	};
+
+	serial@70006300 {
+		compatible = "nvidia,tegra20-uart";
+		reg = <0x70006300 0x100>;
+		reg-shift = <2>;
+		interrupts = < 122 >;
+	};
+
+	serial@70006400 {
+		compatible = "nvidia,tegra20-uart";
+		reg = <0x70006400 0x100>;
+		reg-shift = <2>;
+		interrupts = < 123 >;
+	};
+
+	sdhci@c8000000 {
+		compatible = "nvidia,tegra20-sdhci";
+		reg = <0xc8000000 0x200>;
+		interrupts = < 46 >;
+	};
+
+	sdhci@c8000200 {
+		compatible = "nvidia,tegra20-sdhci";
+		reg = <0xc8000200 0x200>;
+		interrupts = < 47 >;
+	};
+
+	sdhci@c8000400 {
+		compatible = "nvidia,tegra20-sdhci";
+		reg = <0xc8000400 0x200>;
+		interrupts = < 51 >;
+	};
+
+	sdhci@c8000600 {
+		compatible = "nvidia,tegra20-sdhci";
+		reg = <0xc8000600 0x200>;
+		interrupts = < 63 >;
+	};
+
+	usb@c5000000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5000000 0x4000>;
+		interrupts = < 52 >;
+		phy_type = "utmi";
+	};
+
+	usb@c5004000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5004000 0x4000>;
+		interrupts = < 53 >;
+		phy_type = "ulpi";
+	};
+
+	usb@c5008000 {
+		compatible = "nvidia,tegra20-ehci", "usb-ehci";
+		reg = <0xc5008000 0x4000>;
+		interrupts = < 129 >;
+		phy_type = "utmi";
+	};
+
+};
-- 
1.7.7.3
