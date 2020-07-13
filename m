From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 22/25] pinctrl: tegra: pinctrl-tegra194: Do not initialise field twice
Date: Mon, 13 Jul 2020 15:49:27 +0100
Message-ID: <20200713144930.1034632-23-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200713144930.1034632-1-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Both PIN_PINGROUP_ENTRY_Y() and DRV_PINGROUP_ENTRY_Y() macros are
called for each of the 2 pin groups defined here, and both of them
initialise 'drv_reg', causing the compiler to complain.

Only initialise 'drv_reg' once.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized field overwritten [-Woverride-init]
 71 | .drv_reg = ((r)), | ^
 drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of macro ‘DRV_PINGROUP_ENTRY_Y’
 105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
 | ^~~~~~~~~~~~~~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of macro ‘drive_pex_l5_clkreq_n_pgg0’
 124 | drive_##pg_name, | ^~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of macro ‘PINGROUP’
 128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, 0,
 | ^~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initialization for ‘tegra194_groups[0].drv_reg’)
 71 | .drv_reg = ((r)), | ^
 drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of macro ‘DRV_PINGROUP_ENTRY_Y’
 105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
 | ^~~~~~~~~~~~~~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of macro ‘drive_pex_l5_clkreq_n_pgg0’
 124 | drive_##pg_name, | ^~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of macro ‘PINGROUP’
 128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, 0,
 | ^~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized field overwritten [-Woverride-init]
 71 | .drv_reg = ((r)), | ^
 drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of macro ‘DRV_PINGROUP_ENTRY_Y’
 107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
 | ^~~~~~~~~~~~~~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of macro ‘drive_pex_l5_rst_n_pgg1’
 124 | drive_##pg_name, | ^~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of macro ‘PINGROUP’
 130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
 | ^~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initialization for ‘tegra194_groups[1].drv_reg’)
 71 | .drv_reg = ((r)), | ^
 drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of macro ‘DRV_PINGROUP_ENTRY_Y’
 107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
 | ^~~~~~~~~~~~~~~~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of macro ‘drive_pex_l5_rst_n_pgg1’
 124 | drive_##pg_name, | ^~~~~~
 drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of macro ‘PINGROUP’
 130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
 | ^~~~~~~~

Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
index 2e0b5f7bb095b..c94ba17243c87 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra194.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
@@ -98,7 +98,6 @@ static struct tegra_function tegra194_functions[] = {
 		.sfsel_bit = 10,				\
 		.schmitt_bit = schmitt_b,			\
 		.drvtype_bit = 13,				\
-		.drv_reg = -1,					\
 		.parked_bitmask = 0
 
 #define drive_pex_l5_clkreq_n_pgg0				\
-- 
2.25.1
