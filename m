From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 25/34] ARM: tegra: colibri_t30: update compatibility comment
Date: Sat,  1 Sep 2018 10:12:39 +0200
Message-ID: <20180901081248.22639-26-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Update compatibility comment.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 7a4e454a1960..9bd7034b8e66 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -3,7 +3,7 @@
 
 /*
  * Toradex Colibri T30 Module Device Tree
- * Compatible for Revisions V1.1B, V1.1C, V1.1D, V1.1E; IT: V1.1A
+ * Compatible for Revisions V1.1B, V1.1C, V1.1D, V1.1E, V1.1F; IT: V1.1A, V1.1B
  */
 / {
 	model = "Toradex Colibri T30";
-- 
2.14.4
