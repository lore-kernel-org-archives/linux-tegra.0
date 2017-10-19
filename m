From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 1/5] ARM: tegra: Add device tree node to describe IRAM
Date: Fri, 20 Oct 2017 00:34:21 +0300
Message-ID: <8ce696bc2b4b1808f6c7f7a967a3dacd954d2a4e.1508448293.git.digetx@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1508448293.git.digetx@gmail.com>
In-Reply-To: <cover.1508448293.git.digetx@gmail.com>
References: <cover.1508448293.git.digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Vladimir Zapolskiy <vz@mleia.com>

All Tegra SoCs contain 256KiB IRAM, which is used to store CPU resume code
and by hardware engines like a video decoder.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 8 ++++++++
 arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
 arch/arm/boot/dts/tegra20.dtsi  | 8 ++++++++
 arch/arm/boot/dts/tegra30.dtsi  | 8 ++++++++
 4 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 8932ea3afd5f..13f6087790c8 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -10,6 +10,14 @@
 	compatible = "nvidia,tegra114";
 	interrupt-parent = <&lic>;
 
+	iram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x40000000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x40000000 0x40000>;
+	};
+
 	host1x@50000000 {
 		compatible = "nvidia,tegra114-host1x", "simple-bus";
 		reg = <0x50000000 0x00028000>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 8baf00b89efb..a3585ed82646 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -14,6 +14,14 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	iram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x40000000 0x0 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x40000000 0x40000>;
+	};
+
 	pcie@1003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 7c85f97f72ea..aaf32f96f1e8 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -9,6 +9,14 @@
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&lic>;
 
+	iram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x40000000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x40000000 0x40000>;
+	};
+
 	host1x@50000000 {
 		compatible = "nvidia,tegra20-host1x", "simple-bus";
 		reg = <0x50000000 0x00024000>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 13960fda7471..3b447c64bf69 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -10,6 +10,14 @@
 	compatible = "nvidia,tegra30";
 	interrupt-parent = <&lic>;
 
+	iram@40000000 {
+		compatible = "mmio-sram";
+		reg = <0x40000000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x40000000 0x40000>;
+	};
+
 	pcie@3000 {
 		compatible = "nvidia,tegra30-pcie";
 		device_type = "pci";
-- 
2.14.2
