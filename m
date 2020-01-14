From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 01/22] dt-bindings: clock: tegra: Add IDs for OSC clocks
Date: Mon, 13 Jan 2020 23:24:06 -0800
Message-ID: <1578986667-16041-2-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra has OSC, OSC_DIV2 and OSC_DIV4 clocks from OSC pads which are
the possible parents of Tegra PMC clocks clk_out_1, clk_out_2, and
clk_out_3 for Tegra30 through Tegra210.

So, this patch adds ids for these clocks.

Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/dt-bindings/clock/tegra114-car.h        | 4 +++-
 include/dt-bindings/clock/tegra124-car-common.h | 4 +++-
 include/dt-bindings/clock/tegra210-car.h        | 4 +++-
 include/dt-bindings/clock/tegra30-car.h         | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index bb5c2c999c05..df59aaf5bf34 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -228,6 +228,8 @@
 #define TEGRA114_CLK_CLK_M 201
 #define TEGRA114_CLK_CLK_M_DIV2 202
 #define TEGRA114_CLK_CLK_M_DIV4 203
+#define TEGRA114_CLK_OSC_DIV2 202
+#define TEGRA114_CLK_OSC_DIV4 203
 #define TEGRA114_CLK_PLL_REF 204
 #define TEGRA114_CLK_PLL_C 205
 #define TEGRA114_CLK_PLL_C_OUT1 206
@@ -274,7 +276,7 @@
 #define TEGRA114_CLK_CLK_OUT_2 246
 #define TEGRA114_CLK_CLK_OUT_3 247
 #define TEGRA114_CLK_BLINK 248
-/* 249 */
+#define TEGRA114_CLK_OSC 249
 /* 250 */
 /* 251 */
 #define TEGRA114_CLK_XUSB_HOST_SRC 252
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index 0c4f5be0a742..2a9acd592bff 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -227,6 +227,8 @@
 #define TEGRA124_CLK_CLK_M 201
 #define TEGRA124_CLK_CLK_M_DIV2 202
 #define TEGRA124_CLK_CLK_M_DIV4 203
+#define TEGRA124_CLK_OSC_DIV2 202
+#define TEGRA124_CLK_OSC_DIV4 203
 #define TEGRA124_CLK_PLL_REF 204
 #define TEGRA124_CLK_PLL_C 205
 #define TEGRA124_CLK_PLL_C_OUT1 206
@@ -273,7 +275,7 @@
 #define TEGRA124_CLK_CLK_OUT_2 246
 #define TEGRA124_CLK_CLK_OUT_3 247
 #define TEGRA124_CLK_BLINK 248
-/* 249 */
+#define TEGRA124_CLK_OSC 249
 /* 250 */
 /* 251 */
 #define TEGRA124_CLK_XUSB_HOST_SRC 252
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 44f60623f99b..7a8f10b9a66d 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -262,6 +262,8 @@
 #define TEGRA210_CLK_CLK_M 233
 #define TEGRA210_CLK_CLK_M_DIV2 234
 #define TEGRA210_CLK_CLK_M_DIV4 235
+#define TEGRA210_CLK_OSC_DIV2 234
+#define TEGRA210_CLK_OSC_DIV4 235
 #define TEGRA210_CLK_PLL_REF 236
 #define TEGRA210_CLK_PLL_C 237
 #define TEGRA210_CLK_PLL_C_OUT1 238
@@ -355,7 +357,7 @@
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
 /* 325 */
-/* 326 */
+#define TEGRA210_CLK_OSC 326
 /* 327 */
 /* 328 */
 /* 329 */
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 3c90f1535551..7b542c10fc27 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -196,6 +196,8 @@
 #define TEGRA30_CLK_CLK_M 171
 #define TEGRA30_CLK_CLK_M_DIV2 172
 #define TEGRA30_CLK_CLK_M_DIV4 173
+#define TEGRA30_CLK_OSC_DIV2 172
+#define TEGRA30_CLK_OSC_DIV4 173
 #define TEGRA30_CLK_PLL_REF 174
 #define TEGRA30_CLK_PLL_C 175
 #define TEGRA30_CLK_PLL_C_OUT1 176
@@ -243,7 +245,7 @@
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
