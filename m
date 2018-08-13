From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/14] ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
Date: Mon, 13 Aug 2018 16:50:25 +0200
Message-ID: <20180813145027.16346-13-thierry.reding@gmail.com>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 15b73bd377f0..abb5738a0705 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -287,9 +287,13 @@
 			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
 			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
 		interrupt-names = "sync-token", "bsev", "sxe";
-		clocks = <&tegra_car TEGRA20_CLK_VDE>;
-		reset-names = "vde", "mc";
-		resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
+		clocks = <&tegra_car TEGRA20_CLK_VDE>,
+			 <&tegra_car TEGRA20_CLK_BSEV>;
+		clock-names = "vde", "bsev";
+		resets = <&tegra_car 61>,
+			 <&tegra_car 63>,
+			 <&mc TEGRA20_MC_RESET_VDE>;
+		reset-names = "vde", "bsev", "mc";
 	};
 
 	apbmisc@70000800 {
-- 
2.17.0
