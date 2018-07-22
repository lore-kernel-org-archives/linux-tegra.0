From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 26/28] ARM: tegra: apalis_t30: line break long compatible property line
Date: Sun, 22 Jul 2018 18:49:34 +0200
Message-ID: <20180722164936.20581-27-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Line break long compatible property line.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 6978e3626fae..83949ac3cc07 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -6,7 +6,8 @@
 
 / {
 	model = "Toradex Apalis T30 on Apalis Evaluation Board";
-	compatible = "toradex,apalis_t30-eval", "toradex,apalis_t30", "nvidia,tegra30";
+	compatible = "toradex,apalis_t30-eval", "toradex,apalis_t30",
+		     "nvidia,tegra30";
 
 	aliases {
 		rtc0 = "/i2c@7000c000/rtc@68";
-- 
2.14.4
