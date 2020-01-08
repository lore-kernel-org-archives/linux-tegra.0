From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v7 01/21] dt-bindings: clock: tegra: Change CLK_M_DIV to OSC_DIV clocks
Date: Tue, 7 Jan 2020 20:24:55 -0800
Message-ID: <1578457515-3477-2-git-send-email-skomatineni@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra has no CLK_M_DIV2 and CLK_M_DIV4 clocks and instead it has
OSC_DIV2 and OSC_DIV4 clocks from OSC pads.

This patch changes CLK_M_DIV2 and CLK_M_DIV4 clock ids to OSC_DIV2
and OSC_DIV4 clock ids for Tegra30 through Tegra210.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/clock/tegra114-car.h        | 4 ++--
 include/dt-bindings/clock/tegra124-car-common.h | 4 ++--
 include/dt-bindings/clock/tegra210-car.h        | 4 ++--
 include/dt-bindings/clock/tegra30-car.h         | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index bb5c2c999c05..f4880959b094 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -226,8 +226,8 @@
 #define TEGRA114_CLK_FUSE_BURN 199
 #define TEGRA114_CLK_CLK_32K 200
 #define TEGRA114_CLK_CLK_M 201
-#define TEGRA114_CLK_CLK_M_DIV2 202
-#define TEGRA114_CLK_CLK_M_DIV4 203
+#define TEGRA114_CLK_OSC_DIV2 202
+#define TEGRA114_CLK_OSC_DIV4 203
 #define TEGRA114_CLK_PLL_REF 204
 #define TEGRA114_CLK_PLL_C 205
 #define TEGRA114_CLK_PLL_C_OUT1 206
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index 0c4f5be0a742..e7e601a88d3d 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -225,8 +225,8 @@
 #define TEGRA124_CLK_FUSE_BURN 199
 #define TEGRA124_CLK_CLK_32K 200
 #define TEGRA124_CLK_CLK_M 201
-#define TEGRA124_CLK_CLK_M_DIV2 202
-#define TEGRA124_CLK_CLK_M_DIV4 203
+#define TEGRA124_CLK_OSC_DIV2 202
+#define TEGRA124_CLK_OSC_DIV4 203
 #define TEGRA124_CLK_PLL_REF 204
 #define TEGRA124_CLK_PLL_C 205
 #define TEGRA124_CLK_PLL_C_OUT1 206
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 44f60623f99b..6f65c14bf013 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -260,8 +260,8 @@
 #define TEGRA210_CLK_FUSE_BURN 231
 #define TEGRA210_CLK_CLK_32K 232
 #define TEGRA210_CLK_CLK_M 233
-#define TEGRA210_CLK_CLK_M_DIV2 234
-#define TEGRA210_CLK_CLK_M_DIV4 235
+#define TEGRA210_CLK_OSC_DIV2 234
+#define TEGRA210_CLK_OSC_DIV4 235
 #define TEGRA210_CLK_PLL_REF 236
 #define TEGRA210_CLK_PLL_C 237
 #define TEGRA210_CLK_PLL_C_OUT1 238
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 3c90f1535551..907a8a04c280 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -194,8 +194,8 @@
 #define TEGRA30_CLK_TVO 169
 #define TEGRA30_CLK_CLK_32K 170
 #define TEGRA30_CLK_CLK_M 171
-#define TEGRA30_CLK_CLK_M_DIV2 172
-#define TEGRA30_CLK_CLK_M_DIV4 173
+#define TEGRA30_CLK_OSC_DIV2 172
+#define TEGRA30_CLK_OSC_DIV4 173
 #define TEGRA30_CLK_PLL_REF 174
 #define TEGRA30_CLK_PLL_C 175
 #define TEGRA30_CLK_PLL_C_OUT1 176
-- 
2.7.4
