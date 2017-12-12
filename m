From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 3/4] ARM: dts: tegra20: Add device tree node to describe
 IRAM
Date: Tue, 12 Dec 2017 03:26:09 +0300
Message-ID: <92563f9030ab413ff8f6d5a6b6a5680124ec4d98.1513038011.git.digetx@gmail.com>
References: <cover.1513038011.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1513038011.git.digetx@gmail.com>
In-Reply-To: <cover.1513038011.git.digetx@gmail.com>
References: <cover.1513038011.git.digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Vladimir Zapolskiy <vz@mleia.com>

All Tegra20 SoCs contain 256KiB IRAM, which is used to store
resume code and by a video decoder engine.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 914f59166a99..36909df653c3 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -10,6 +10,14 @@
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
-- 
2.15.1
