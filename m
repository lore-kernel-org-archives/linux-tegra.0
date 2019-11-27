From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v2 03/11] dt-bindings: soc: tegra-pmc: Add id for Tegra PMC blink control
Date: Tue, 26 Nov 2019 20:59:25 -0800
Message-ID: <1574830773-14892-4-git-send-email-skomatineni@nvidia.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has a blinking control to output 32 KHz clock to blink
pin.

This patch adds id for this blink control to use for enabling or
disabling the blink output through devicetree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/soc/tegra-pmc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/soc/tegra-pmc.h b/include/dt-bindings/soc/tegra-pmc.h
index 705ee8083070..6fe28516017e 100644
--- a/include/dt-bindings/soc/tegra-pmc.h
+++ b/include/dt-bindings/soc/tegra-pmc.h
@@ -12,7 +12,8 @@
 #define TEGRA_PMC_CLK_OUT_2		3
 #define TEGRA_PMC_CLK_OUT_3_MUX		4
 #define TEGRA_PMC_CLK_OUT_3		5
+#define TEGRA_PMC_CLK_BLINK		6
 
-#define TEGRA_PMC_CLK_MAX		6
+#define TEGRA_PMC_CLK_MAX		7
 
 #endif	/* _DT_BINDINGS_SOC_TEGRA_PMC_H */
-- 
2.7.4
