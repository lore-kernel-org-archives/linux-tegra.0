From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2] pinctrl: tegra: Correctly check the supported configuration
Date: Mon, 2 May 2016 22:53:24 +0530
Message-ID: <1462209804-16582-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, rklein@nvidia.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The pincontrol registers of Tegra chips has multiple filed per
registers. There is two type of registers mux and drive. All
configurations belongs to one of these registers.

If any configurations are supported then <config>_bit is set to
bit position of these registers otherwise -1 to not support it.
The member is defined as
	s32 <config>_bit:6;

So if config is not supported ifor given SoC then it is set to -1
in soc pinmmux table.
In common driver code, to find out that given config is supported
or not, it is checked as:

s8 bit = <config>_bit;
if (bit > 31) {
	/* Not supported config */
}

But in this case, bit is s8 and hence for non supporting it is -1.

Correct the check as:
if (bit < 0) {
	/* Not supported config */
}

Fixes: e4c02dced975cb ("pinctrl: tegra: use signed bitfields for optional fields")

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 861baf2..6e82b29 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -417,7 +417,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		return -ENOTSUPP;
 	}
 
-	if (*reg < 0 || *bit > 31) {
+	if (*reg < 0 || *bit < 0)  {
 		if (report_err) {
 			const char *prop = "unknown";
 			int i;
-- 
2.1.4

