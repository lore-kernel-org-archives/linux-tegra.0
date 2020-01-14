From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v8 17/22] ASoC: nau8825: change Tegra clk_out_2 provider to tegra_pmc
Date: Mon, 13 Jan 2020 23:24:22 -0800
Message-ID: <1578986667-16041-18-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra clk_out_1, clk_out_2, and clk_out_3 are part of PMC block and
these clocks are moved from clock drvier to pmc driver with pmc as
a provider for these clocks.

Update bindings document to use pmc as clock provider for clk_out_2 and
change id to pmc clock id.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 Documentation/devicetree/bindings/sound/nau8825.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
index d16d96839bcb..388a7bc60b1f 100644
--- a/Documentation/devicetree/bindings/sound/nau8825.txt
+++ b/Documentation/devicetree/bindings/sound/nau8825.txt
@@ -101,5 +101,5 @@ Example:
       nuvoton,crosstalk-enable;
 
       clock-names = "mclk";
-      clocks = <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
+      clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_2>;
   };
-- 
2.7.4
