From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 03/21] dt-bindings: clock: tegra: Add DT id for OSC clock
Date: Tue, 7 Jan 2020 20:24:57 -0800
Message-ID: <1578457515-3477-4-git-send-email-skomatineni@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

OSC is one of the parent for Tegra clocks clk_out_1, clk_out_2, and
clk_out_3.

This patch adds DT id for OSC clock to allow parent configuration
through device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/clock/tegra114-car.h        | 2 +-
 include/dt-bindings/clock/tegra124-car-common.h | 2 +-
 include/dt-bindings/clock/tegra210-car.h        | 2 +-
 include/dt-bindings/clock/tegra30-car.h         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index f4880959b094..e3927cabccad 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -274,7 +274,7 @@
 #define TEGRA114_CLK_CLK_OUT_2 246
 #define TEGRA114_CLK_CLK_OUT_3 247
 #define TEGRA114_CLK_BLINK 248
-/* 249 */
+#define TEGRA114_CLK_OSC 249
 /* 250 */
 /* 251 */
 #define TEGRA114_CLK_XUSB_HOST_SRC 252
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index e7e601a88d3d..45b2bada8ac0 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -273,7 +273,7 @@
 #define TEGRA124_CLK_CLK_OUT_2 246
 #define TEGRA124_CLK_CLK_OUT_3 247
 #define TEGRA124_CLK_BLINK 248
-/* 249 */
+#define TEGRA124_CLK_OSC 249
 /* 250 */
 /* 251 */
 #define TEGRA124_CLK_XUSB_HOST_SRC 252
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 6f65c14bf013..383ee591ffa7 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -355,7 +355,7 @@
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
 /* 325 */
-/* 326 */
+#define TEGRA210_CLK_OSC 326
 /* 327 */
 /* 328 */
 /* 329 */
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 907a8a04c280..5d71f0c0a732 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -243,7 +243,7 @@
 #define TEGRA30_CLK_HCLK 217
 #define TEGRA30_CLK_PCLK 218
 /* 219 */
-/* 220 */
+#define TEGRA30_CLK_OSC 220
 /* 221 */
 /* 222 */
 /* 223 */
-- 
2.7.4
