From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [pinmux scripts PATCH 2/2] soc: Get rid of .remove callback
Date: Tue, 3 May 2016 00:16:45 +0530
Message-ID: <1462214805-26735-2-git-send-email-ldewangan@nvidia.com>
References: <1462214805-26735-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462214805-26735-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Pinctrl driver uses the devm_pinctrl_register and hence it is not
required to generate code for .remove callback.

Remove the need of .remove callback.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 soc-to-kernel-pinctrl-driver.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/soc-to-kernel-pinctrl-driver.py b/soc-to-kernel-pinctrl-driver.py
index f5851f5..65e4c60 100755
--- a/soc-to-kernel-pinctrl-driver.py
+++ b/soc-to-kernel-pinctrl-driver.py
@@ -643,7 +643,6 @@ static struct platform_driver %(soc)s_pinctrl_driver = {
 		.of_match_table = %(soc)s_pinctrl_of_match,
 	},
 	.probe = %(soc)s_pinctrl_probe,
-	.remove = tegra_pinctrl_remove,
 };
 module_platform_driver(%(soc)s_pinctrl_driver);
 
-- 
2.1.4
