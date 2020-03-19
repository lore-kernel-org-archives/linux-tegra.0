From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 8/9] pinctrl: tegra: Renumber the GG.0 and GG.1 pins
Date: Thu, 19 Mar 2020 13:27:36 +0100
Message-ID: <20200319122737.3063291-9-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200319122737.3063291-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There is no need to define these at a specific offset since they are the
only pins defined for this SoC generation. Begin numbering them at 0.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 61fc7e680788..61afe5fe9dec 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -24,17 +24,14 @@
 
 /* Define unique ID for each pins */
 enum pin_id {
-	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
-	TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
-	TEGRA_PIN_NUM_GPIOS = 258,
+	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
+	TEGRA_PIN_PEX_L5_RST_N_PGG1,
 };
 
 /* Table for pin descriptor */
 static const struct pinctrl_pin_desc tegra194_pins[] = {
-	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
-		    "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
-	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
-		    "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0, "PEX_L5_CLKREQ_N_PGG0"),
+	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1, "PEX_L5_RST_N_PGG1"),
 };
 
 static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
-- 
2.24.1
